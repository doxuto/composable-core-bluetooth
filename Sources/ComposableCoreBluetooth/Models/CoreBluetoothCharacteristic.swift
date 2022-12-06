//
//  CoreBluetoothCharacteristic.swift
//  
//
//  Created by doxuto on 06/12/2022.
//

import Foundation

struct CoreBluetoothCharacteristic: Equatable {
    var service: CoreBluetoothService?
    var value: Data?
    var descriptors: [CoreBluetoothDescriptor]?
    var properties: CoreBluetoothCharacteristicProperties
    var isNotifying: Bool
    var isBroadcasted: Bool
}

struct CoreBluetoothCharacteristicProperties: Equatable {

}
struct CoreBluetoothDescriptor: Equatable {

}
