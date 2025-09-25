//
//  Footer.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 16/09/2025.
//

import SwiftUI

struct Footer: View {
    @ObservedObject var viewModel: WorkoutConfigurationViewModel
    @Binding var showingSettings: Bool
    
    init(viewModel: WorkoutConfigurationViewModel? = nil, showingSettings: Binding<Bool>? = nil) {
        print("inside init")
        if let sharedViewModel = viewModel {
            self.viewModel = sharedViewModel
        } else {
            self.viewModel = WorkoutConfigurationViewModel()
        }
        if let settingsBinding = showingSettings {
            self._showingSettings = settingsBinding
        } else {
            self._showingSettings = .constant(false)
        }
        print("End of Init method")
    }

    
    var body: some View {
//        VStack(spacing: 0) {
//            Spacer()

        // Footer container
        HStack(spacing: 0) {
            // Play button
            ImageButton(systemName: "play.circle", size: .large) {
                print("Play button tapped")
            }
            Spacer()
            HStack(spacing: 0) {
                // Reset button
                ImageButton(systemName: "arrow.counterclockwise.circle", size: .large) {
                    print("Reset button tapped")
                }

                // Settings button
                ImageButton(systemName: "gearshape.circle", size: .large) {
                    showingSettings = true
                    print(showingSettings)
                }
            }
        }
        .padding(.horizontal, 8)
        .padding(.top, 16)
        .background(
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .ignoresSafeArea(edges: .bottom)
        )
//        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        Footer()
    }
}
