//
//  Wall.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 9/21/21.
//

import SwiftUI

struct Wall: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.black)
    }
}
