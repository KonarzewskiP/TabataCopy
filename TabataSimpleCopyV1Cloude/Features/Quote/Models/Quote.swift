//
//  Quote.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import Foundation

// MARK: - Quote Model
// This struct represents a single quote with its author
struct Quote: Codable {
    let quote: String
    let author: String
    
    private enum CodingKeys: String, CodingKey {
        case quote = "q"
        case author = "a"
    }
}

// MARK: - API Response Model
// This represents the structure of the API responses
struct QuoteResponse: Codable {
    let quotes: [Quote]
    

}
