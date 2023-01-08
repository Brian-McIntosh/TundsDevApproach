//
//  QuotesScreen.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import SwiftUI

struct QuotesScreen: View {
    var body: some View {
        
        List {
            ForEach(Quote.dummyData, id: \.anime) { item in
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
                .foregroundColor(.red)
            }
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
