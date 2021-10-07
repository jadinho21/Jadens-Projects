//
//  Walls.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/4/21.
//

import SwiftUI

struct Walls: View {
    var body: some View {
        ZStack {
            Wall(width: 460, height: 20).position(x: 200, y: 110)
            Wall(width: 20, height: 90).position(x: 420, y: 160)
            Wall(width: 100, height: 20).position(x: 75, y: 295)
            Wall(width: 75, height: 20).position(x: 790, y: 215)
            Wall(width: 20, height: 110).position(x: 750, y: 170)
            Wall(width: 75, height: 20).position(x: 790, y: 125)
            Wall(width: 20, height: 70).position(x: 500, y: 350)
            Wall(width: 100, height: 20).position(x: 560, y: 325)
            Wall(width: 20, height: 70).position(x: 600, y: 350)
        }
    }
}

struct Walls_Previews: PreviewProvider {
    static var previews: some View {
        Walls()
    }
}
