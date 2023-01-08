//
//  QuotesScreen.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())
    
    var body: some View {
        List {
//            ForEach(Quote.dummyData, id: \.anime) { item in
//                QuoteView(item: item)
//            }
            ForEach(vm.quotes, id: \.anime) { item in
                QuoteView(item: item)
            }
        }
        .task {
            await vm.getRandomQuotes()
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
