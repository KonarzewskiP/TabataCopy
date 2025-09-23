//
//  WorkoutConfigurationViewModel.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 20/09/2025.
//

import SwiftUI

@MainActor
class WorkoutConfigurationViewModel: ObservableObject {
    
    @Published var workoutConfig: WorkoutConfiguration = .init()

    func setTimeInterval(_ timeInSeconds: Int) -> Int {
        guard timeInSeconds >= 0 else { return 0 }

        return timeInSeconds
    }

    func setRounds(_ rounds: Int) -> Int {
        guard rounds > 0 else { return 1 }
        guard rounds < 100 else { return 99 }
        return rounds
    }
    
    func incrementInitialCountdown() {
        workoutConfig.initialCountdown += 1
    }
}
