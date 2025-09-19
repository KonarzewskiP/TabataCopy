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
}

// MARK: - API Response Model
// This represents the structure of the API response
struct QuoteResponse: Codable {
    let quotes: [Quote]
    

}
