//
//  PersonalQuotesView.swift
//  QuotesApp
//
//  Created by Jeffrey Sweeney on 10/13/21.
//

import SwiftUI

struct PersonalQuotesView: View {
    var famousQuotes: FamousQuotes
    var body: some View {
        ZStack {
            Image(famousQuotes.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack (alignment: .leading) {
                ForEach(famousQuotes.allQuotes, id: \.self) { quote in
                    Text(quote)
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.horizontal, 100)
                        .padding()
                }
            }
        }.navigationTitle(famousQuotes.quoteBy)
    }
}

struct PersonalQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FamousQuotesModel.instance
        PersonalQuotesView(famousQuotes: viewModel.famousQuotes[0])
    }
}
