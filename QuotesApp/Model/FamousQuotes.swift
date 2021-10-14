//
//  FamousQuotes.swift
//  QuotesApp
//
//  Created by Jeffrey Sweeney on 10/13/21.
//

import Foundation

struct FamousQuotes: Decodable, Identifiable {
    var id: UUID?
    var image: String
    var quoteBy: String
    var mainQuote: String
    var allQuotes: [String]
}
