//
//  Settings.swift
//  Bob The Bouncing Ball (iOS)
//
//  Created by Jaden Sylvester on 9/28/21.
//

import SwiftUI

struct Settings: View {
    
    @Binding var navigate: Screens
    
    var body: some View {
        Form {
            changeColorSection
        }
    }
    
    var changeColorSection: some View {
        Section(header: Text("Change Color")) {
//            ColorPicker("Color", selection: $backgroundColor)
//                .onChange(of: backgroundColor) { color in
//                    changeColor(color: RGBAColor(color: backgroundColor))
////                }
        }
    }
}

//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        Settings()
//    }
//}
