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

            VStack(spacing: 0) {
                
                VStack(alignment: .leading) {
//                    Spacer()
                    Text("Whoever is happy will make other happy too.")

                    Text("Anne Frank")
                        .fontWeight(.bold)
                }
                .foregroundStyle(.white)

                // Footer with control buttons
                Footer()
//                    .frame(alignment: .bottom)
            }
        }
    }
}

#Preview {
    Main()
}
