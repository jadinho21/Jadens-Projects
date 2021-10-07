//
//  Spikes.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/4/21.
//

import SwiftUI

struct Spikes: View {
    var body: some View {
        Spike().position(x: 300, y: 130)
        Spike().position(x: 420, y: 550).rotationEffect(.degrees(270))
        Spike().position(x: 550, y: 345)
        // x higher goes up
        // y higher goes right
    }
}

struct Spikes_Previews: PreviewProvider {
    static var previews: some View {
        Spikes()
    }
}
