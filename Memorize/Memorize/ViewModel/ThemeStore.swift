//
//  ThemeStore.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/17/21.
//

//
//  ThemeStore.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/17/21.
//

import SwiftUI

//struct Palette: Identifiable, Codable, Hashable {
//    var name: String
//    var emojis: String
//    var id: Int
//
//    fileprivate init(name: String, emojis: String, id: Int) {
//        self.name = name
//        self.emojis = emojis
//        self.id = id
//    }
//}

class ThemeStore<Content: Codable> : ObservableObject {
    
    let name: String
    
    @Published var themes = [Theme<Content>]() {
        didSet {
            storeInUserDefaults()
        }
    }
    
    private var userDefaultsKey: String {
        "ThemeStore:" + name
    }
    
    private func storeInUserDefaults() {
        UserDefaults.standard.set(try? JSONEncoder().encode(themes), forKey: userDefaultsKey)
//        UserDefaults.standard.set(themes.map { [$0.name, $0.emojis, String($0.id)] }, forKey: userDefaultsKey)
    }
    
    private func restoreFromUserDefaults() {
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedThemes = try? JSONDecoder().decode([Theme<Content>].self, from: jsonData) {
            themes = decodedThemes
        }
    }
    
    init(named name: String) where Content == String {
        self.name = name
        restoreFromUserDefaults()
        if themes.isEmpty {
            for theme in Themes.themes {
                insertTheme(theme)
            }
        } else {
            print("successfully loaded themes from the user defaults: \(themes)")
        }
    }
    
    // MARK: - Intent
    
    func theme(at index: Int) -> Theme<Content> {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if themes.count > 1, themes.indices.contains(index) {
            themes.remove(at: index)
        }
        return index % themes.count
    }
    
    func insertTheme(_ theme: Theme<Content>, at index: Int = 0) {
        let safeIndex = min(max(index, 0), themes.count)
        themes.insert(theme, at: safeIndex)
    }
    
    func insertTheme(name: String, content: [Content] = [], numPairs: Int, color: RGBAColor, at index: Int = 0) {
        let unique = (themes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let theme = Theme<Content>(name: name, content: content, numPairs: numPairs, color: RGBAColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0), id: unique)
        
        insertTheme(theme)
    }
    
    
}
