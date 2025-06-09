//
//  ScoreManager.swift
//  The blue trip
//
//  Created by Brandon Grande on 01/06/2025.
//

import Foundation

struct ScoreManager {
    private static let defaults = UserDefaults.standard

    static func getScore() -> Int {
        defaults.integer(forKey: Constants.Keys.score)
    }

    static func saveScore(_ score: Int) {
        defaults.setValue(score, forKey: Constants.Keys.score)
    }
}
