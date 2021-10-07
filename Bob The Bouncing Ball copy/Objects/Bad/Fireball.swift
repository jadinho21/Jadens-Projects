//
//  Fireball.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/4/21.
//

import SwiftUI

struct Fireball: View {
    var body: some View {
        Image("Fireball2")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}

struct Fireball_Previews: PreviewProvider {
    static var previews: some View {
        Fireball()
    }
}
