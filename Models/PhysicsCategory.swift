//
//  PhysicsCategory.swift
//  The blue trip
//
//  Created by Brandon Grande on 01/06/2025.
//

import Foundation

struct PhysicsCategory {
    static let all: UInt32 = UInt32.max
    static let none: UInt32 = 0
    static let enemy: UInt32 = 0b1
    static let player: UInt32 = 0b100
}
