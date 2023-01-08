//
//  QuoteView.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import SwiftUI

struct QuoteView: View {
    
    // inject
    let item: Quote
    
    var body: some View {
        // cut from forEach loop on main screen
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "tv")
                    .font(.system(size: 12, weight: .black))
                Text(item.anime)
            }
            
            Text(item.character)
            Text(item.quote)
        }
        .padding()
        .foregroundColor(.black)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        // inject to resolve error
        QuoteView(item: Quote.dummyData.first!)
    }
}
