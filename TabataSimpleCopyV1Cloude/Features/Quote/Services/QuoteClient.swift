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
    
        do {
            print("🌐 Fetching quote from: \(url)")
            
            // Perform the network request
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print("📊 Response received - Data size: \(data.count) bytes")
            
            // Check if the response is successful (status code 200-299)
            guard let httpResponse = response as? HTTPURLResponse else {
                print("❌ Invalid HTTP response type")
                throw QuoteError.invalidResponse
            }
            
            print("📡 HTTP Status Code: \(httpResponse.statusCode)")
            
            guard httpResponse.statusCode == 200 else {
                print("❌ HTTP Error - Status Code: \(httpResponse.statusCode)")
                throw QuoteError.invalidResponse
            }
            
            // Log the raw response for debugging
            if let responseString = String(data: data, encoding: .utf8) {
                print("📝 Raw response: \(responseString)")
            }
            
            // Decode the JSON response into our Quote model
            // ZenQuotes returns an array, so we take the first element
            let quotes = try JSONDecoder().decode([Quote].self, from: data)
            guard let quote = quotes.first else {
                print("❌ No quotes found in response")
                throw QuoteError.noData
            }
            
            print("✅ Successfully fetched quote: \"\(quote.quote)\" - \(quote.author)")
            return quote
            
        } catch let decodingError as DecodingError {
            print("❌ JSON Decoding Error: \(decodingError)")
            print("📄 Decoding failure reason: \(decodingError.localizedDescription)")
            throw QuoteError.decodingFailed(decodingError)
            
        } catch let urlError as URLError {
            print("❌ Network Error: \(urlError)")
            print("🌐 Network failure reason: \(urlError.localizedDescription)")
            print("🔍 Error Code: \(urlError.code.rawValue)")
            throw QuoteError.networkError(urlError)
            
        } catch {
            print("❌ Unexpected Error: \(error)")
            print("🔍 Error type: \(type(of: error))")
            throw QuoteError.unknown(error)
        }
    }
    
    /// Fetches multiple random quotes
    /// - Parameter count: Number of quotes to fetch
    /// - Returns: Array of Quote objects
    func fetchRandomQuotes(count: Int = 5) async throws -> [Quote] {
        // Validate input
        guard count > 0 else {
            print("❌ Invalid count: \(count)")
            throw QuoteError.invalidCount(count: count)
        }
        
        let url = URL(string: "\(baseURL)/api/quotes")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            print("🌐 Fetching \(count) quotes from: \(url)")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print("📊 Response received - Data size: \(data.count) bytes")
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("❌ Invalid HTTP response type")
                throw QuoteError.invalidResponse
            }
            
            print("📡 HTTP Status Code: \(httpResponse.statusCode)")
            
            guard httpResponse.statusCode == 200 else {
                print("❌ HTTP Error - Status Code: \(httpResponse.statusCode)")
                throw QuoteError.invalidResponse
            }
            
            let quotes = try JSONDecoder().decode([Quote].self, from: data)
            let resultQuotes = Array(quotes.prefix(min(count, quotes.count)))
            
            print("✅ Successfully fetched \(resultQuotes.count) quotes")
            return resultQuotes
            
        } catch let decodingError as DecodingError {
            print("❌ JSON Decoding Error: \(decodingError)")
            throw QuoteError.decodingFailed(decodingError)
            
        } catch let urlError as URLError {
            print("❌ Network Error: \(urlError)")
            throw QuoteError.networkError(urlError)
            
        } catch {
            print("❌ Unexpected Error: \(error)")
            throw QuoteError.unknown(error)
        }
    }
}

