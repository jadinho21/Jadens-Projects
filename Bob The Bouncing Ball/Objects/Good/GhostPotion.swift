//
//  GhostPotion.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/5/21.
//

import SwiftUI

struct GhostPotion: View {
    var body: some View {
        Image("GhostPotion5")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

struct GhostPotion_Previews: PreviewProvider {
    static var previews: some View {
        GhostPotion()
    }
}
