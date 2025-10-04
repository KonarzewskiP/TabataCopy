//
//  WorkoutConfigurationSection.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 20/09/2025.
//

import SwiftUI

struct WorkoutConfigurationSection: View {
    @ObservedObject var viewModel: WorkoutConfigurationViewModel

    init(viewModel: WorkoutConfigurationViewModel? = nil) {
        if let sharedViewModel = viewModel {
            self.viewModel = sharedViewModel
        } else {
            self.viewModel = WorkoutConfigurationViewModel()
        }
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.bottom)

                VStack(spacing: 8) {
                    SettingRow(name: "Number of Sets",
                               value: $viewModel.workoutConfig.numberOfSets,
                               type: .setSets)
                    SettingRow(name: "Initial Countdown",
                               value: $viewModel.workoutConfig.initialCountdown,
                               type: .setTime)
                    SettingRow(name: "Warmup",
                               value: $viewModel.workoutConfig.warmupInterval,
                               type: .setTime)
                    SettingRow(name: "Exercise",
                               value: $viewModel.workoutConfig.exerciseInterval,
                               type: .setTime)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    NavigationStack {
        ZStack {
            Color.black.ignoresSafeArea()
            WorkoutConfigurationSection()
        }
    }
}
