//
//  Bob_The_Bouncing_BallApp.swift
//  Shared
//
//  Created by Jaden Sylvester on 9/20/21.
//

import SwiftUI

@main
struct Bob_The_Bouncing_BallApp: App {
    
    @StateObject private var viewModel = GameMechanics()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
