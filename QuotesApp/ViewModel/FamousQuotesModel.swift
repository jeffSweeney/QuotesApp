//
//  FamousQuotesModel.swift
//  QuotesApp
//
//  Created by Jeffrey Sweeney on 10/13/21.
//

import Foundation

class FamousQuotesModel: ObservableObject {
    @Published var famousQuotes = [FamousQuotes]()
    
    // Singleton instance
    static let instance = FamousQuotesModel()
    
    // Private to force use of instance above
    private init() {
        famousQuotes = FetchAndDecode.fetchAndDecodeQuotes()
    }
}
