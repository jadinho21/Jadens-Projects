//
//  EmojiMemoryGame.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 7/1/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    @Published private var model: MemoryGame<String>
    
    private static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
        let emojis = theme.content.shuffled()
        let numPairs = min(theme.numPairs, theme.content.count)
        
        return MemoryGame<String>(numberOfPairsOfCards: numPairs) { pairIndex in (emojis[pairIndex]) }
    }
    
    private(set) var theme: Theme<String>
    
    func getCardColor() -> Color {
        return theme.color.stringToColor()
    }
    
    func score() -> Int {
        model.score
    }
    
    init() {
        theme = Themes.themes.randomElement()!
        model = Self.createMemoryGame(theme: theme)
    }
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        theme = Themes.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}


