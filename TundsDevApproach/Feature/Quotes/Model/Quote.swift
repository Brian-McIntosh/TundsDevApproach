//
//  Quote.swift
//  TundsDevApproach
//
//  Created by Brian McIntosh on 1/8/23.
//

import Foundation

struct Quote: Decodable {
    let anime: String
    let character: String
    let quote: String
}

extension Quote {
    static let dummyData: [Quote] = [
        Quote(anime: "Anime1", character: "Character1", quote: "Quote1"),
        Quote(anime: "Anime2", character: "Character2", quote: "Quote2"),
        Quote(anime: "Anime3", character: "Character3", quote: "Quote3"),
        Quote(anime: "Anime4", character: "Character4", quote: "Quote4"),
        Quote(anime: "Anime5", character: "Character5", quote: "Quote5")
    ]
}
