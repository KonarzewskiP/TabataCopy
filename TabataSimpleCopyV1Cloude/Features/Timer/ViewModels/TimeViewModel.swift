//
//  TimeViewModel.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 23/09/2025.
//

import Foundation

@MainActor
class TimeViewModel: ObservableObject {
    @Published var time: String = "00:00:00"
}
