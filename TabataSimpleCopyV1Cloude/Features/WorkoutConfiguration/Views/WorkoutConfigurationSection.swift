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
        VStack(spacing: 20) {
            Text("Workout Configuration")
                .foregroundColor(.white)
                .font(.title)
                .padding(.bottom)
            
            VStack(spacing: 20) {
                VStack {
                    Text("Initial Countdown: \(viewModel.workoutConfig.initialCountdown)")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    ImageButton(systemName: "plus") {
                        viewModel.incrementInitialCountdown()
                    }
                }
                
                VStack {
                    Text("Warmup: \(viewModel.workoutConfig.warmupInterval)s")
                        .foregroundColor(.blue)
                        .font(.headline)
                    
                    ImageButton(systemName: "plus") {
                        viewModel.incrementWarmupInterval()
                    }
                }
                
                VStack {
                    Text("Exercise: \(viewModel.workoutConfig.exerciseInterval)s")
                        .foregroundColor(.red)
                        .font(.headline)
                    
                    ImageButton(systemName: "plus") {
                        viewModel.incrementExerciseInterval()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        WorkoutConfigurationSection()
    }
}
