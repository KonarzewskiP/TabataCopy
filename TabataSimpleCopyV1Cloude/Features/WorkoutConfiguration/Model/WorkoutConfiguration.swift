//
//  WorkoutConfiguration.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 20/09/2025.
//

import Foundation

// MARK: - Time Configuration

struct WorkoutConfiguration {
    var initialCountdown: Int = 0
    var warmupInterval: Int = 0
    var exerciseInterval: Int = 0
    var restInterval: Int = 0

    // Private backing properties for validated fields
    private var _numberOfSets: Int = 1
    private var _numberOfCycles: Int = 1

    var recoveryInterval: Int = 0
    var cooldownInterval: Int = 0

    // Computed property with validation for numberOfSets
    var numberOfSets: Int {
        get {
            return _numberOfSets
        }
        set {
            _numberOfSets = max(1, newValue) // Ensures value is never less than 1
        }
    }

    // Computed property with validation for numberOfCycles
    var numberOfCycles: Int {
        get {
            return _numberOfCycles
        }
        set {
            _numberOfCycles = max(1, newValue) // Ensures value is never less than 1
        }
    }
}
