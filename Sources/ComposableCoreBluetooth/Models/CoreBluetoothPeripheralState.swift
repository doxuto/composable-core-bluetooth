//
//  CoreBluetoothPeripheralState.swift
//  
//
//  Created by doxuto on 06/12/2022.
//

import Foundation

enum CoreBluetoothPeripheralState: Int, @unchecked Sendable {
    case disconnected // The peripheral isn’t connected to the central manager.
    case connecting //The peripheral is in the process of connecting to the central manager.
    case connected //The peripheral is connected to the central manager.
    case disconnecting //The peripheral is disconnecting from the central manager.
}
