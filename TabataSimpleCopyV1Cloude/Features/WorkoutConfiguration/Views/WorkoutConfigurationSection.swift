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

                VStack(spacing: 0) {
                    HStack {
                        Text("Number of Sets: \(viewModel.workoutConfig.numberOfSets)")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        NavigationLink(
                            destination: WheelPickerSetting(number: $viewModel.workoutConfig.numberOfSets, settingName: "Number of XXX")
                        ) {
                            Image(systemName: "plus")
                                .withImageButtonFormatting(size: .medium)
                        }
                    }

                    HStack {
                        Text("Initial Countdown: \(viewModel.workoutConfig.initialCountdown)")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        ImageButton(systemName: "plus") {
                            viewModel.incrementInitialCountdown()
                        }
                    }

                    HStack {
                        Text("Warmup: \(viewModel.workoutConfig.warmupInterval)s")
                            .foregroundColor(.blue)
                            .font(.headline)
                        Spacer()
                        ImageButton(systemName: "plus") {
                            viewModel.incrementWarmupInterval()
                        }
                    }

                    HStack {
                        Text("Exercise: \(viewModel.workoutConfig.exerciseInterval)s")
                            .foregroundColor(.red)
                            .font(.headline)
                        Spacer()
                        ImageButton(systemName: "plus") {
                            viewModel.incrementExerciseInterval()
                        }
                    }
                }
                .padding()
            }
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
