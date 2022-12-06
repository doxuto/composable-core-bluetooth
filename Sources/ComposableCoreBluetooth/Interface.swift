//
//  Interface.swift
//
//
//  Created by doxuto on 06/12/2022.
//

import Foundation
import Combine
import CoreBluetooth
import ComposableArchitecture

public struct CoreBluetoothManager {
    public enum Action: Equatable {
        case centralManagerDidUpdateState(CoreBluetoothManagerState)
        case centralManagerConnectResult(TaskResult<CBPeripheral>)
        case centralManagerDisconnectResult(TaskResult<CBPeripheral>)
        case centralManagerWillRestore([String: Any])
        case centralManagerConnectionEventDidOccur(CBConnectionEvent, CBPeripheral)
        case centralManagerDidDiscover(peripheral: CBPeripheral, advertisementData: [String : Any], rssi: NSNumber)
        case centralManagerDidUpdateANCSAuthorizationFor(peripheral: CBPeripheral)
        case peripheralManagerDidUpdateState(CBPeripheralManager)
        public static func == (lhs: CoreBluetoothManager.Action, rhs: CoreBluetoothManager.Action) -> Bool {
            return false
        }
    }

    public var delegate: () -> EffectTask<Action>

    public var isScanning: () -> Bool

    //    public var set(properties: Properties) -> EffectTask<Never>
}

extension CoreBluetoothManager {
    public struct Properties: Equatable {

    }
}
