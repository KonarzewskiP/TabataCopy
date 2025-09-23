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
    case decodingFailed(DecodingError) // Specific decoding error with details
    case networkError(URLError) // Network-related errors
    case unknown(Error) // Catch-all for unexpected errors
    case invalidCount(count: Int) // New validation error

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
        case let .decodingFailed(decodingError):
            return "JSON decoding failed: \(decodingError.localizedDescription)"
        case let .networkError(urlError):
            return "Network error: \(urlError.localizedDescription)"
        case let .unknown(error):
            return "Unexpected error: \(error.localizedDescription)"
        case let .invalidCount(count):
            return "Invalid count: \(count). Count must be greater than 0."
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .networkError:
            return "Please check your internet connection and try again."
        case .decodingFailed:
            return "The server response format has changed. Please try again later."
        case .invalidCount:
            return "Please provide a count greater than 0."
        default:
            return "Please try again."
        }
    }
}
