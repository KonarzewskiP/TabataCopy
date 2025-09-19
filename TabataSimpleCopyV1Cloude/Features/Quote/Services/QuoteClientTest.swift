//
//  QuoteClientTest.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import Foundation

// MARK: - Test Class
// This is a simple test to verify our API integration works
class QuoteClientTest {
    
    static func testAPI() async {
        let client = QuoteClient()
        
        do {
            print("Testing API connection...")
            let quote = try await client.fetchRandomQuote()
            print("✅ Success! Quote received:")
            print("Text: \(quote.quote)")
            print("Author: \(quote.author)")
        } catch {
            print("❌ Error: \(error.localizedDescription)")
        }
    }
}

// MARK: - Usage Example
// To test this, you can call QuoteClientTest.testAPI() from anywhere in your app
// For example, in your app's main view or in a test function
