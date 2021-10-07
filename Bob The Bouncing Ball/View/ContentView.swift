//
//  ContentView.swift
//  Shared
//
//  Created by Jaden Sylvester on 9/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var screen: Screens = .home
    @State var viewModel: GameMechanics
        
    var body: some View {
        switch screen {
        case .home:
            HomeView(navigate: $screen)
        case .game:
            LevelOneView(viewModel: viewModel, navigate: $screen)
        case .settings:
            Text("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = GameMechanics()
        if #available(iOS 15.0, *) {
            ContentView(viewModel: viewModel)
                .previewInterfaceOrientation(.landscapeRight)
        } else {
            // Fallback on earlier versions
        }
    }
}
