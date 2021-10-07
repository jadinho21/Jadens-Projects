//
//  GhostKing.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/6/21.
//

import SwiftUI

struct GhostKing: View {
    var body: some View {
        Image("GhostKing3")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}

struct GhostKing_Previews: PreviewProvider {
    static var previews: some View {
        GhostKing()
    }
}
