//
//  QuoteError.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import Foundation

// MARK: - Quote Error
// Custom error types for the Quote feature
enum QuoteError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError
    case invalidCount(count: Int)  // New validation error
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to decode response"
        case .invalidCount(let count):
            return "Invalid count: \(count). Count must be greater than 0."
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidCount:
            return "Please provide a count greater than 0."
        default:
            return nil
        }
    }
}
