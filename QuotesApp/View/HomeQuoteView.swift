//
//  ContentView.swift
//  QuotesApp
//
//  Created by Jeffrey Sweeney on 10/13/21.
//

import SwiftUI

struct HomeQuoteView: View {
    @ObservedObject var quotesViewModel = FamousQuotesModel.instance
    
    var body: some View {
        NavigationView {
            List(quotesViewModel.famousQuotes) { famousQuote in
                NavigationLink {
                    PersonalQuotesView(famousQuotes: famousQuote)
                } label: {
                    ZStack {
                        Image(famousQuote.image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                        
                        VStack (alignment: .leading) {
                            Text(famousQuote.mainQuote)
                                .fontWeight(.bold)
                                .padding()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            
                            Text("- \(famousQuote.quoteBy)")
                                .padding()
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
            }.navigationTitle("Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeQuoteView()
    }
}
