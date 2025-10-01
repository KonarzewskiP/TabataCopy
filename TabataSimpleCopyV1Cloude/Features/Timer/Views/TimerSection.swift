//
//  TimerSection.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 23/09/2025.
//

import SwiftUI

struct TimerSection: View {
    @ObservedObject var workoutConfigViewModel: WorkoutConfigurationViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Timer View")
                .foregroundColor(.white)
                .font(.title)

            Text("Initial Countdown from Config: \(workoutConfigViewModel.workoutConfig.initialCountdown)")
                .foregroundColor(.green)
                .font(.title2)

            Text("Warmup Interval: \(workoutConfigViewModel.workoutConfig.warmupInterval)")
                .foregroundColor(.blue)
                .font(.body)

            Text("Exercise Interval: \(workoutConfigViewModel.workoutConfig.exerciseInterval)")
                .foregroundColor(.red)
                .font(.body)
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        TimerSection(workoutConfigViewModel: WorkoutConfigurationViewModel())
    }
}
