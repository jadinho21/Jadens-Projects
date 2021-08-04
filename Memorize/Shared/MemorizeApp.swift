//
//  MemorizeApp.swift
//  Shared
//
//  Created by Jaden Sylvester on 6/29/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
