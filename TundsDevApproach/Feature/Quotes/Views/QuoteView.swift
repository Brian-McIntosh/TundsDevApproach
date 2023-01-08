//
//  QuoteView.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import SwiftUI

struct QuoteView: View {
    
    let item: Quote
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(item: Quote.dummyData.first!)
    }
}
