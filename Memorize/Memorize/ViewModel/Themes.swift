//
//  Themes.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/3/21.
//

import SwiftUI

struct Themes {
    static let themes = [
        Theme(name: "Sport", content: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒"], numPairs: 13, color: RGBAColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), id: 0),
        Theme(name: "Vehicle", content: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛"], numPairs: 13, color: RGBAColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), id: 1),
        Theme(name: "Element", content: ["⚡️", "☄️", "💥", "🔥", "🌪", "🌈", "☀️", "🌤", "☁️", "🌧", "❄️", "💧", "💨"], numPairs: 13, color: RGBAColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), id: 2),
        Theme(name: "Animal", content: ["🐶", "🐱", "🐰", "🦊", "🐽", "🐸", "🐵"], numPairs: 8, color: RGBAColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), id: 3),
        Theme(name: "Food", content: ["🍎", "🍊", "🍌", "🍉", "🍇", "🍓", "🍒", "🥝", "🥥", "🥨", "🥕", "🍞"], numPairs: 10, color: RGBAColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), id: 4),
        Theme(name: "Colors", content: ["🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤"], numPairs: 6, color: RGBAColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0), id: 5)
    ]
}
