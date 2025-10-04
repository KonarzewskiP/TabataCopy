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
    @Binding var value: Int
    let type: SettingType

    init(name: String, value: Binding<Int>, type: SettingType) {
        self.name = name
        _value = value
        self.type = type
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

            NavigationLink(
                destination: WheelPickerSetting(number: $value, settingName: name))
            {
                Image(systemName: "chevron.right")
                    .withImageButtonFormatting(size: .tiny)
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
    NavigationStack {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                SettingRow(name: "Initial Countdown", value: .constant(2), type: .setTime)
                SettingRow(name: "Number of Sets", value: .constant(1), type: .setSets)
                SettingRow(name: "Number of Cycles", value: .constant(0), type: .setCycles)
            }
        }
    }
}
