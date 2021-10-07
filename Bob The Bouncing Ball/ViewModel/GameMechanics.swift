//
//  GameMechanics.swift
//  Bob The Bouncing Ball
//
//  Created by Jaden Sylvester on 9/20/21.
//

import SwiftUI

class GameMechanics: ObservableObject {
    
    @Published private var model: BobGame
    
    private static func createBobGame() -> BobGame {
        return BobGame(keyIsTouched: false)
    }
    
    init() {
        model = Self.createBobGame()
    }
}
