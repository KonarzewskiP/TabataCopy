//
//  WorkoutConfiguration.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 20/09/2025.
//

import Foundation

// MARK: - Time Configuration
struct WorkoutConfiguration {
    @Min(0) var initialCountdown: Int = 0
    @Min(0) var warmupInterval: Int = 0
    @Min(0) var exerciseInterval: Int = 0
    @Min(0) var restInterval: Int = 0
    @Min(0) var recoveryInterval: Int = 0
    @Min(0) var cooldownInterval: Int = 0
}
