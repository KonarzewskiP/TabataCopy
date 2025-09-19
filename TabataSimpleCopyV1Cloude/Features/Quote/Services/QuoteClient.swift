//
//  QuoteClient.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import Foundation

// MARK: - Quote Client
// This class handles all API communication for quotes
// It's a thin wrapper around network calls - no business logic
class QuoteClient {
    
    // MARK: - Properties
    // The base URL for the quotes API
    private let baseURL = "https://zenquotes.io"
    
    // MARK: - Methods
    
    /// Fetches a random quote from the API
    /// - Returns: A Quote object or nil if there's an error
    func fetchRandomQuote() async throws -> Quote {
        // Construct the full URL
        let url = URL(string: "\(baseURL)/api/random")!

        // Create a URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Perform the network request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Check if the response is successful (status code 200-299)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw QuoteError.invalidResponse
        }
        
        // Decode the JSON response into our Quote model
        // ZenQuotes returns an array, so we take the first element
        let quotes = try JSONDecoder().decode([Quote].self, from: data)
        guard let quote = quotes.first else {
            throw QuoteError.noData
        }
        return quote
    }
    
    /// Fetches multiple random quotes
    /// - Parameter count: Number of quotes to fetch
    /// - Returns: Array of Quote objects
    func fetchRandomQuotes(count: Int = 5) async throws -> [Quote] {
        // Validate input
        guard count > 0 else {
            throw QuoteError.invalidCount(count: count)
        }
        
        let url = URL(string: "\(baseURL)/api/quotes")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw QuoteError.invalidResponse
        }
        
        let quotes = try JSONDecoder().decode([Quote].self, from: data)
    
        return Array(quotes.prefix(min(count, quotes.count)))
    }
}

