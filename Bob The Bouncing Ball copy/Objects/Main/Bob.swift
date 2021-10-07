//
//  Bob.swift
//  Bob The Bouncing Ball
//
//  Created by Jaden Sylvester on 9/20/21.
//

import SwiftUI

struct Bob: View {
    
    @State var bobPosition = CGPoint(x: 50, y: 30)
    
    var body: some View {
        Image("Bob")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}
