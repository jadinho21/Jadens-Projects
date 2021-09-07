//
//  Color + RGBAColor.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/26/21.
//

import SwiftUI

struct Color___RGBAColor: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RGBAColor: Codable, Equatable, Hashable {
 let red: Double
 let green: Double
 let blue: Double
 let alpha: Double
}
extension Color {
 init(rgbaColor rgba: RGBAColor) {
 self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
 }
}
extension RGBAColor {
 init(color: Color) {
 var red: CGFloat = 0
 var green: CGFloat = 0
 var blue: CGFloat = 0
 var alpha: CGFloat = 0
 if let cgColor = color.cgColor {
 UIColor(cgColor: cgColor).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
 }
 self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
 }
}

struct Color___RGBAColor_Previews: PreviewProvider {
    static var previews: some View {
        Color___RGBAColor()
    }
}
