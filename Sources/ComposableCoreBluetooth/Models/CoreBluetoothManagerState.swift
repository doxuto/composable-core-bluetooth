//
//  CoreBluetoothManagerState.swift
//  
//
//  Created by doxuto on 06/12/2022.
//

import Foundation
import CoreBluetooth

public enum CoreBluetoothManagerState: Int, @unchecked Sendable {
    case unknown //    The manager’s state is unknown.
    case resetting //    A state that indicates the connection with the system service was momentarily lost.
    case unsupported //    A state that indicates this device doesn’t support the Bluetooth low energy central or client role.
    case unauthorized //    A state that indicates the application isn’t authorized to use the Bluetooth low energy role.
    case poweredOff // A state that indicates Bluetooth is currently powered off.
    case poweredOn //    A state that indicates Bluetooth is currently powered on and available to use.

    public init(from state: CBManagerState) {
        self = Self(rawValue: state.rawValue) ?? .unknown
    }
}

