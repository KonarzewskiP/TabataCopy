//
//  ImageButton.swift
//  TabataSimpleCopyV1
//
//  Created by Pawel Konarzewski on 15/09/2025.
//

import SwiftUI

struct ImageButton: View {
    // Size variants enum
    enum Size {
        case tiny
        case small
        case medium
        case large

        var iconSize: CGFloat {
            switch self {
            case .tiny: return 20
            case .small: return 32
            case .medium: return 46
            case .large: return 60
            }
        }

        var padding: CGFloat {
            switch self {
            case .tiny: return 12
            case .small: return 8
            case .medium: return 4
            case .large: return 0
            }
        }
    }

    let systemName: String
    let size: Size
    let onTap: () -> Void

    // @escaping is used to escape the closure to avoid memory leaks and ensure the closure is executed after the button is tapped
    // Default initializer with medium size
    init(systemName: String, size: Size = .medium, onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.size = size
        self.onTap = onTap // Assign the closure to the onTap property for later use
    }

    var body: some View {
        Button(action: onTap) {
            Image(systemName: systemName)
                .withImageButtonFormatting(size: size)
        }
        .buttonStyle(PlainButtonStyle()) // This is important to remove the default button style
    }
}

struct ImageButtonViewModifier: ViewModifier {
    let size: ImageButton.Size
    func body(content: Content) -> some View {
        content
            .font(.system(size: size.iconSize, weight: .medium))
            .foregroundStyle(.white)
            .padding(size.padding)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black.opacity(0.001))
            )
    }
}

extension View {
    func withImageButtonFormatting(size: ImageButton.Size = .medium) -> some View {
        modifier(ImageButtonViewModifier(size: size))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 20) {
            Text("ImageButton Size Variants")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom, 20)

            // Small size variant
            HStack {
                Text("Tiny:")
                    .foregroundColor(.white)
                ImageButton(systemName: "gearshape.circle", size: .tiny) {
                    print("Tiny gear button tapped!")
                }
                ImageButton(systemName: "play.circle", size: .tiny) {
                    print("Tiny play button tapped!")
                }
            }

            // Small size variant
            HStack {
                Text("Small:")
                    .foregroundColor(.white)
                ImageButton(systemName: "gearshape.circle", size: .small) {
                    print("Small gear button tapped!")
                }
                ImageButton(systemName: "play.circle", size: .small) {
                    print("Small play button tapped!")
                }
            }

            // Medium size variant (default)
            HStack {
                Text("Medium:")
                    .foregroundColor(.white)
                ImageButton(systemName: "arrow.counterclockwise.circle") {
                    print("Medium reset button tapped!")
                }
                ImageButton(systemName: "pause.circle") {
                    print("Medium pause button tapped!")
                }
            }

            // Large size variant
            HStack {
                Text("Large:")
                    .foregroundColor(.white)
                ImageButton(systemName: "stop.circle", size: .large) {
                    print("Large stop button tapped!")
                }
                ImageButton(systemName: "gearshape.circle",
                            size: .large,
                            onTap: {
                                print("Large forward button tapped!")
                            })
            }
        }
    }
}
