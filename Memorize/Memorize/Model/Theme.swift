//
//  Theme.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/24/21.
//

import Foundation

struct Theme<Content: Codable> : Codable, Identifiable, Hashable {
    
    static func == (lhs: Theme<Content>, rhs: Theme<Content>) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var name: String
    var content: [Content]
    var numPairs: Int
    var color: RGBAColor
    var id: Int
}
