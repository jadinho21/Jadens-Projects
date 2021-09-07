//
//  MemorizeApp.swift
//  Shared
//
//  Created by Jaden Sylvester on 6/29/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var themeStore = ThemeStore<String>(named: "name")
    
    var body: some Scene {
        WindowGroup {
            ThemeChooser()
                .environmentObject(themeStore)
        }
    }
}
