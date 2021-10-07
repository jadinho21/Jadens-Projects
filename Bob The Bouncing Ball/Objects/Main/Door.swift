//
//  Door.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 9/21/21.
//

import SwiftUI

struct Door: View {
    
    @State var keyCollected: Bool = false
    
    var body: some View {
        Image("Door")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 200)
    }
    
    func update() {
        
    }
}
