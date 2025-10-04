//
//  WheelPickerSetting.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 04/10/2025.
//

import SwiftUI

struct WheelPickerSetting: View {
    @State private var selectedSets: Int = 62

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                // Top label
                Text("Number Of Sets")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.top, 20)

                Spacer()

                // Current selection display (center)
                Text("\(selectedSets) Sets")
                    .font(.system(size: 28, weight: .regular))
                    .foregroundColor(.white)

                Spacer()

                // Bottom wheel picker
                Picker("Number of Sets", selection: $selectedSets) {
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
    ZStack {
        Color.black.ignoresSafeArea()
        WheelPickerSetting()
    }
}
