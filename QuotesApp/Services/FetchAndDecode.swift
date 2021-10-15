//
//  FetchAndDecode.swift
//  QuotesApp
//
//  Created by Jeffrey Sweeney on 10/13/21.
//

import Foundation

class FetchAndDecode {
    private init() {
        // Just making this private so no instances can be created. Using
        // the static method is all we need on this service
    }
    
    static func fetchAndDecodeQuotes() -> [FamousQuotes] {
        var result = [FamousQuotes]()
        
        // Get the resource in the Bundle
        if let pathString = Bundle.main.path(forResource: "data", ofType: "json") {
            // Turn the pathString into a URL
            let url = URL(fileURLWithPath: pathString)
            
            // Get the data object
            do {
                let data = try Data(contentsOf: url)
                
                // Decode the data
                let decoder = JSONDecoder()
                do {
                    var decodedData = try decoder.decode([FamousQuotes].self, from: data)
                    
                    // Assign a UUID to the decoded data
                    for index in 0 ..< decodedData.count {
                        decodedData[index].id = UUID()
                    }
                    
                    // Assign result
                    result = decodedData
                } catch {
                    // Couldn't decode the data
                    print(error)
                }
            } catch {
                // Couldn't turn the URL into a data object
                print(error)
            }
        }
        
        return result
    }
}
