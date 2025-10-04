//
//  SettingRow.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 01/10/2025.
//

import SwiftUI

struct SettingRow: View {
    enum SettingType {
        case setTime
        case setSets
        case setCycles

        var unit: String {
            switch self {
            case .setTime: return "second"
            case .setSets: return "set"
            case .setCycles: return "cycle"
            }
        }

        var image: String {
            switch self {
            case .setTime: return "stopwatch"
            case .setSets: return "star.fill"
            case .setCycles: return "repeat"
            }
        }
    }

    let name: String
    var value: Int
    let type: SettingType
    let onTap: () -> Void

    init(name: String, value: Int, type: SettingType, onTap: @escaping () -> Void) {
        self.name = name
        self.value = value
        self.type = type
        self.onTap = onTap // Assign the closure to the onTap property for later use
    }

    var colors: [Color] = [.orange, .yellow, .green, .blue, .indigo, .purple]
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .frame(width: 30, height: 30)
                .cornerRadius(5)
                .foregroundColor(colors.randomElement() ?? .gray)
                .overlay {
                    Image(systemName: type.image)
                        .foregroundStyle(.white)
                }

            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("\(displayUnits(value: value))")
            }
            .foregroundStyle(.white)

            Spacer()

            ImageButton(systemName: "chevron.right", size: .tiny) {
                onTap()
            }
        }
    }

    private func displayUnits(value: Int) -> String {
        if value == 1 {
            return "\(value) \(type.unit)"
        }

        return "\(value) \(type.unit)s"
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SettingRow(name: "Initial Countdown", value: 2, type: .setTime) { print("Xd") }
            SettingRow(name: "Number of Sets", value: 1, type: .setSets) { print("LoL") }
            SettingRow(name: "Number of Cycles", value: 0, type: .setCycles) {}
        }
    }
}
