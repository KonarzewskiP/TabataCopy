//
//  WheelPickerSetting.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 04/10/2025.
//

import SwiftUI

struct WheelPickerSetting: View {
    @Binding var number: Int
    var settingName: String

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                // Top label
                Text("\(settingName)")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.top, 20)

                Spacer()

                // Current selection display (center)
                Text("\(number) Sets")
                    .font(.system(size: 28, weight: .regular))
                    .foregroundColor(.white)

                Spacer()

                // Bottom wheel picker
                Picker("Number of Sets", selection: $number) {
                    ForEach(1 ... 99, id: \.self) { number in
                        Text("\(number) Sets")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white)
                            .tag(number)
                    }
                }
                .pickerStyle(.wheel)
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    @Previewable @State var numberOfSets = 10
    ZStack {
        Color.black.ignoresSafeArea()
        WheelPickerSetting(number: $numberOfSets, settingName: "Number of Sets")
    }
}
