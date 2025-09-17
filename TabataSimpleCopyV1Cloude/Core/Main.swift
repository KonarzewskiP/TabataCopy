//
//  Main.swift
//  TabataSimpleCopyV1
//
//  Created by Pawel Konarzewski on 15/09/2025.
//

import SwiftUI

struct Main: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 32) {
                
                VStack(alignment: .leading) {
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
                .foregroundStyle(.white)
                
                VStack(alignment: .leading) {
//                    Spacer()
                    Text("Whoever is happy will make other happy too.")

                    Text("Anne Frank")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)

                // Footer with control buttons
                Footer()
                    .padding(.top, 24)
            }
        }
    }
}

#Preview {
    Main()
}
