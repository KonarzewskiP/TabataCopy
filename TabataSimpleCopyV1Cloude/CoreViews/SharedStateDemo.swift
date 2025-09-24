//
//  SharedStateDemo.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 24/09/2025.
//

import SwiftUI

struct SharedStateDemo: View {
    @StateObject private var sharedWorkoutConfigViewModel = WorkoutConfigurationViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Shared State Demo")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Configuration Section - where you modify the data
                WorkoutConfigurationSection(viewModel: sharedWorkoutConfigViewModel)
                
                Divider()
                    .background(Color.gray)
                
                // Timer Section - where you see the changes
                TimerSection(workoutConfigViewModel: sharedWorkoutConfigViewModel)
                
                Text("💡 Tap the plus buttons above to see changes reflected below!")
                    .foregroundColor(.yellow)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    SharedStateDemo()
}
