//
//  QuoteSection.swift
//  TabataSimpleCopyV1Cloude
//
//  Created by Pawel Konarzewski on 18/09/2025.
//

import SwiftUI

struct QuoteSection: View {
    
    // MARK: - Properties
    // Use our ViewModel to manage the quote state
    // @StateObject
    // Creates and owns an object (usually a ViewModel)
    // Keeps it alive for the lifetime of the view
    // Automatically updates the UI when the object's @Published properties change
    @StateObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            // Check if we're loading
            if viewModel.isLoading {
                // Show loading indicator
                HStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                    Text("Loading quote...")
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            // Check if there's an error
            else if let errorMessage = viewModel.errorMessage {
                // Show error message with retry button
                VStack(alignment: .leading, spacing: 8) {
                    Text("Failed to load quote")
                        .foregroundColor(.red)
                    Text(errorMessage)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Button("Retry") {
                        viewModel.refreshQuote()
                    }
                    .foregroundColor(.blue)
                    .padding(.top, 4)
                }
            }
            // Show the quote if we have one
            else if let quote = viewModel.currentQuote {
                VStack(alignment: .leading, spacing: 4) {
                    Text(quote.quote)
                        .foregroundColor(.white)
                    
                    Text(quote.author)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    // Attribution link
                    Link("Powered by ZenQuotes", destination: URL(string: "https://zenquotes.io")!)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.top, 2)
                }
                .onTapGesture {
                    // Allow tapping to refresh the quote
                    viewModel.refreshQuote()
                }
            }
            // Fallback if no quote is available
            else {
                VStack(alignment: .leading, spacing: 4) {
                    Text("The only way to do great work is to love what you do.")
                        .foregroundColor(.white)
                    
                    Text("Steve Jobs")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        QuoteSection()
    }
}
