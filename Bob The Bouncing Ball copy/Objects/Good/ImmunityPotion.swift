//
//  ImmunityPotion.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 10/5/21.
//

import SwiftUI

struct ImmunityPotion: View {
    var body: some View {
        Image("ImmunityPotion2")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}

struct ImmunityPotion_Previews: PreviewProvider {
    static var previews: some View {
        ImmunityPotion()
    }
}
