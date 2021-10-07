//
//  BobGame.swift
//  Bob The Bouncing Ball
//
//  Created by Jaden Sylvester on 9/20/21.
//

import Foundation

struct BobGame {
    var keyIsTouched: Bool
    
    mutating func onKeyCollected() {
        enableDoor()
        keyIsTouched = true
    }
    
    func enableDoor() {
        Door().update()
    }
}
