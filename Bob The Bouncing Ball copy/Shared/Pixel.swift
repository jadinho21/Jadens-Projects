//
//  Pixel.swift
//  Bob The Bouncing Ball
//
//  Created by Jaden Sylvester on 9/20/21.
//

import SwiftUI

struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
