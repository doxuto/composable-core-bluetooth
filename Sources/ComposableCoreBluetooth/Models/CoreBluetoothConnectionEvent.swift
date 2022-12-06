//
//  CoreBluetoothConnectionEvent.swift
//  
//
//  Created by doxuto on 06/12/2022.
//

import Foundation
import CoreBluetooth

public enum CoreBluetoothConnectionEvent: Int, @unchecked Sendable {
    case peerDisconnected = 0
    case peerConnected = 1

    init(from event: CBConnectionEvent) {
        self = .init(rawValue: event.rawValue) ?? .peerDisconnected
    }
}
