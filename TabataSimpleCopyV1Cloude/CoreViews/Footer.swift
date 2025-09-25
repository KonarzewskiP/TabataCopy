//
//  Footer.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 16/09/2025.
//

import SwiftUI

struct Footer: View {
    @ObservedObject var viewModel: WorkoutConfigurationViewModel
    
    init(viewModel: WorkoutConfigurationViewModel? = nil) {
        if let sharedViewModel = viewModel {
            self.viewModel = sharedViewModel
        } else {
            self.viewModel = WorkoutConfigurationViewModel()
        }
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
                    print("Settings button tapped")
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
    Footer()
}
