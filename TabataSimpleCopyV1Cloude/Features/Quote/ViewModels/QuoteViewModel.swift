//
//  QuoteViewModel.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import Foundation

// MARK: - Quote View Model

// This class manages the state of quotes in our app
@MainActor
class QuoteViewModel: ObservableObject {
    // MARK: - Published Properties

    // These properties automatically update the UI when they change
    @Published var currentQuote: Quote?
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Private Properties

    private let quoteClient = QuoteClient()

    // MARK: - Initialization

    init() {
        // Load a quote when the view model is created
        Task {
            await loadRandomQuote()
        }
    }

    // MARK: - Public Methods

    /// Loads a random quote from the API
    func loadRandomQuote() async {
        // Set loading state to true
        isLoading = true
        errorMessage = nil

        do {
            // Fetch quote from API
            let quote = try await quoteClient.fetchRandomQuote()

            // Update the current quote
            currentQuote = quote

        } catch {
            // Handle any errors
            errorMessage = error.localizedDescription
            print("Error loading quote: \(error)")
        }

        // Set loading state to false
        isLoading = false
    }

    /// Refreshes the current quote
    func refreshQuote() {
        Task {
            await loadRandomQuote()
        }
    }

    /// Gets a fallback quote when API fails
    private func getFallbackQuote() -> Quote {
        return Quote(quote: "The only way to do great work is to love what you do.",
                     author: "Steve Jobs")
    }
}
