//
//  WorkoutConfigurationSection.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 20/09/2025.
//

import SwiftUI

struct WorkoutConfigurationSection: View {
    @StateObject private var viewModel = WorkoutConfigurationViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Initial Countdown: \(viewModel.workoutConfig.initialCountdown)")
                .foregroundColor(.white)
                .font(.title2)
            
            ImageButton(systemName: "plus") {
                viewModel.incrementInitialCountdown()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        WorkoutConfigurationSection()
    }
}
