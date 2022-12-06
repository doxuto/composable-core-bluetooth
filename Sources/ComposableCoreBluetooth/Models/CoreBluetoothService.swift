//
//  CoreBluetoothService.swift
//  
//
//  Created by doxuto on 06/12/2022.
//

import Foundation

struct CoreBluetoothService: Equatable {
    var peripheral: CoreBluetoothPeripheral?
    var isPrimary: Bool
    var characteristics: [CoreBluetoothCharacteristic]?
    var includedServices: [CoreBluetoothService]?

}
