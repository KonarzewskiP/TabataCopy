//
//  AppError.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import Foundation

// MARK: - App Error
// General errors used across the entire app
enum AppError: Error, LocalizedError {
    case invalidInput(String)
    case networkError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidInput(let message):
            return "Invalid input: \(message)"
        case .networkError:
            return "Network connection error"
        case .unknownError:
            return "An unknown error occurred"
        }
    }
}
