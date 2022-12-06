//
//  Live.swift
//
//
//  Created by doxuto on 06/12/2022.
//

import Foundation
import Combine
import CoreBluetooth
import ComposableArchitecture

public extension CoreBluetoothManager {
    static var live: Self = { () -> Self in

        let centralManager = CBCentralManager()
        let peripheralManager = CBPeripheralManager()

        let delegate = EffectTask<CoreBluetoothManager.Action>.run { subcriber in
            let delegate = CoreBluetoothManagerDelegate(subcriber: subcriber)
            centralManager.delegate = delegate
            peripheralManager.delegate = delegate

            return AnyCancellable {
                _ = delegate
            }
        }
            .share()
            .eraseToEffect()

        return Self(
            delegate: { delegate },
            isScanning: {
                centralManager.isScanning
            }
        )
    }()
}

public class CoreBluetoothManagerDelegate: NSObject, CBCentralManagerDelegate, CBPeripheralManagerDelegate {
    let subcriber: EffectTask<CoreBluetoothManager.Action>.Subscriber

    deinit {
        print(#file, #function)
    }

    public init(
        subcriber: EffectTask<CoreBluetoothManager.Action>.Subscriber
    ) {
        self.subcriber = subcriber
    }

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print(#function, central.state)
        subcriber.send(.centralManagerDidUpdateState(CoreBluetoothManagerState(from: central.state)))
    }

    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        subcriber.send(.centralManagerConnectResult(.success(peripheral)))
        Task {
        }
    }

    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        if let error {
            subcriber.send(.centralManagerConnectResult(.failure(error)))
        } else {
            subcriber.send(.centralManagerConnectResult(.success(peripheral)))
        }
    }

    public func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        subcriber.send(.centralManagerWillRestore(dict))
    }

    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let error {
            subcriber.send(.centralManagerDisconnectResult(.failure(error)))
        } else {
            subcriber.send(.centralManagerDisconnectResult(.success(peripheral)))
        }
    }

    public func centralManager(_ central: CBCentralManager, didUpdateANCSAuthorizationFor peripheral: CBPeripheral) {
        subcriber.send(.centralManagerDidUpdateANCSAuthorizationFor(peripheral: peripheral))
    }

    public func centralManager(_ central: CBCentralManager, connectionEventDidOccur event: CBConnectionEvent, for peripheral: CBPeripheral) {
        subcriber.send(.centralManagerConnectionEventDidOccur(event, peripheral))
    }

    public func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        subcriber.send(.peripheralManagerDidUpdateState(peripheral))
    }
}
