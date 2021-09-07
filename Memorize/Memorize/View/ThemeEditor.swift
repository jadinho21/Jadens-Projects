//
//  ThemeEditor.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/18/21.
//

import SwiftUI

struct ThemeEditor: View {
    
    @Binding var theme: Theme<String>
    
    var body: some View {
        Form {
            nameSection
            addEmojisSection
            removeEmojiSection
            changeColorSection
            numberPairsSection
        }
        .navigationTitle("Edit \(theme.name)")
        .frame(minWidth: 300, minHeight: 350)
    }
    
    var nameSection: some View {
        Section(header: Text("Name")) {
            TextField("Name", text: $theme.name)
        }
    }
    
    @State private var emojisToAdd = ""
    @State private var numberOfPairs = 18
    @State private var themeColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    var addEmojisSection: some View {
        Section(header: Text("Add Emojis")) {
            TextField("Add Emojis", text: $emojisToAdd)
                .onChange(of: emojisToAdd) { emojis in
                    addEmojis(emojis)
                }
        }
    }
    
    var changeColorSection: some View {
        Section(header: Text("Change Color")) {
            ColorPicker("Color", selection: $themeColor)
                .onChange(of: themeColor) { theme in
                    changeColor(color: RGBAColor(color: themeColor))
                }
        }
    }
    
    var numberPairsSection: some View {
        VStack {
            Stepper("Enter number of pairs", value: $numberOfPairs)
            Text("Number of pairs: \(numberOfPairs)")
        }.onChange(of: numberOfPairs) { theme in
            changeNumPair(pairs: numberOfPairs)
        }
    }
    
    func changeNumPair(pairs: Int) {
        theme.numPairs = pairs
    }
    func changeColor(color: RGBAColor) {
        theme.color = color
    }
    
    func addEmojis(_ emojis: String) {
        withAnimation {
            let array = Array(emojis)
            for emoji in array {
                theme.content.append(String(emoji))
            }
            array.filter { $0.isEmoji }
        }
    }
    
    var removeEmojiSection: some View {
        Section(header: Text("Remove Emoji")) {
            let emojis = theme.content.map { String($0) }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            withAnimation {
                                theme.content.removeAll(where: { String($0) == emoji })
                            }
                        }
                }
            }
            .font(.system(size: 40))
        }
    }
}
