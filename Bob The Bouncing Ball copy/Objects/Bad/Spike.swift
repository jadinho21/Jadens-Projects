//
//  Spike.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/4/21.
//

import SwiftUI

struct Spike: View {
    var body: some View {
        Image("Spikes3")
            .resizable()
            .scaledToFit()
            .frame(width: 225, height: 225)
    }
}

struct Spike_Previews: PreviewProvider {
    static var previews: some View {
        Spike()
    }
}
