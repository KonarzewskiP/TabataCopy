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
    var recoveryInterval: Int = 0
    var cooldownInterval: Int = 0

    // Validated properties - automatically enforce minimum value of 1
    var numberOfSets: Int = 1 {
        didSet {
            numberOfSets = ensureMinimumValue(numberOfSets)
        }
    }

    var numberOfCycles: Int = 1 {
        didSet {
            numberOfCycles = ensureMinimumValue(numberOfCycles)
        }
    }

    // MARK: - Private Helper Methods

    /// Ensures the value is never less than 1
    /// - Parameter value: The value to validate
    /// - Returns: The value if >= 1, otherwise returns 1
    private func ensureMinimumValue(_ value: Int) -> Int {
        return value < 1 ? 1 : value
    }
}
