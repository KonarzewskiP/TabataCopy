//
//  Main.swift
//  TabataSimpleCopyV1
//
//  Created by Pawel Konarzewski on 15/09/2025.
//

import SwiftUI

struct Main: View {
    @StateObject private var sharedWorkoutConfigViewModel = WorkoutConfigurationViewModel()

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 32) {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Press Play To")
                        .font(.system(size: 50))
                    Text("Start")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    Spacer()
                    Spacer()

                    Text("Loaded Preset ")
                        +
                        Text("Tabata")
                        .fontWeight(.bold)

                    Text("Last workout: ")
                        +
                        Text("Yesterday")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Quote section with API integration
                QuoteSection()

                // Footer with control buttons
                Footer(viewModel: sharedWorkoutConfigViewModel)
                    .padding(.top, 24)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    NavigationStack {
        Main()
    }
}
