//
//  CoreBluetoothPeripheral.swift
//  
//
//  Created by doxuto on 06/12/2022.
//

import Foundation

struct CoreBluetoothPeripheral: Equatable {
    var name: String?
    var services: [CoreBluetoothService]?

    var state: CoreBluetoothPeripheralState
    var rssi: NSNumber?
    var ancsAuthorized: Bool

}
