//
//  HomeView.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 9/30/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var navigate: Screens
    
    var body: some View {
        ZStack {
            VStack {
                Text("Bob The Bouncing Ball!").font(.custom("Helvetica Neue", size: 30))
                Image("PlayButton2")
                    .resizable()
                    .font(.custom("String", size: 200))
                    .onTapGesture {
                        withAnimation {
                            navigate = .game
                        }
                    }
            }
        }.background(Color.purple).ignoresSafeArea()
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(navigate:)
//    }
//}
