//
//  QuotesViewModel.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import Foundation

protocol QuotesViewModel: ObservableObject {
    func getRandomQuotes() async 
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {

    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    init(service: QuotesService) {
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            self.quotes = try await service.fetchRandomQuotes()
        } catch {
            print(error)
        }
    }
}
