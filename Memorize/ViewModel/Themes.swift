//
//  Themes.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/3/21.
//

import SwiftUI

struct Themes {
    static let themes = [
        Theme(name: "Sport", content: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒"], numPairs: 13, color: "Blue"),
        Theme(name: "Vehicle", content: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛"], numPairs: 13, color: "Red"),
        Theme(name: "Element", content: ["⚡️", "☄️", "💥", "🔥", "🌪", "🌈", "☀️", "🌤", "☁️", "🌧", "❄️", "💧", "💨"], numPairs: 13, color: "Purple"),
        Theme(name: "Animal", content: ["🐶", "🐱", "🐰", "🦊", "🐽", "🐸", "🐵"], numPairs: 8, color: "Yellow"),
        Theme(name: "Food", content: ["🍎", "🍊", "🍌", "🍉", "🍇", "🍓", "🍒", "🥝", "🥥", "🥨", "🥕", "🍞"], numPairs: 10, color: "Green"),
        Theme(name: "Colors", content: ["🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤"], numPairs: 6, color: "Gray")
    ]
}
