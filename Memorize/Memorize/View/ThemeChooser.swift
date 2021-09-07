//
//  ThemeChooser.swift
//  Memorize (iOS)
//
//  Created by Jaden Sylvester on 8/17/21.
//

import SwiftUI

struct ThemeChooser: View {
    var emojiFontSize: CGFloat = 40
    var emojiFont: Font { .system(size: emojiFontSize) }
    
    @EnvironmentObject var themeStore: ThemeStore<String>
    @Environment(\.presentationMode) var presentationMode

    @State private var themeToEdit: Theme<String>?
    
    @State private var chosenThemeIndex = 0
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeStore.themes) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(game: EmojiMemoryGame(theme))) {
                        listItem(for: theme)
                    }
                }
                .onDelete { indexSet in
                    themeStore.themes.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, newOffset in
                    themeStore.themes.move(fromOffsets: indexSet, toOffset: newOffset)
                }
            }
            .navigationTitle("Memorize")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem { EditButton() }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        themeStore.insertTheme(name: "New", content: [], numPairs: 12, color: RGBAColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0), at: chosenThemeIndex)
//                        themeToEdit = themeStore.theme(at: chosenThemeIndex)
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .environment(\.editMode, $editMode)
            .sheet(item: $themeToEdit) {
                theme in ThemeEditor(theme: $themeStore.themes[themeToEdit ?? themeStore.themes[0]])
            }
        }
    }
    
    func tap(_ theme : Theme<String>) -> some Gesture {
        TapGesture().onEnded {
            themeToEdit = theme
            print("tappedON \(theme.name)")
        }
    }
    
    func listItem(for theme: Theme<String>) -> some View {
        VStack {
            Text("Theme: \(theme.name)")
            Text(" Contains \(theme.numPairs) pairs of cards!")
            ScrollingEmojisView(emojis: theme.content)
                .font(emojiFont)
            RoundedRectangle(cornerRadius: 16.0).foregroundColor(Color(rgbaColor: theme.color))
        }
        .gesture(editMode == .active ? tap(theme) : nil)
        .id(theme.id)
        .transition(rollTransition)
//        .popover(isPresented: $editing) {
//            PaletteEditor(palette: $store.palettes[chosenPaletteIndex])
//        }
        
//        .popover(item: $themeToEdit) { theme in
//            ThemeEditor(theme: $themeStore.themes[theme])
//        }
//        .sheet(isPresented: $managing) {
////            ThemeManager()
//        }
    }
    
    var rollTransition: AnyTransition {
        AnyTransition.asymmetric(insertion: .offset(x: 0, y: emojiFontSize), removal: .offset(x: 0, y: -emojiFontSize))
    }
    
    struct ScrollingEmojisView: View {
        let emojis: [String]

        var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(emojis.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .onDrag { NSItemProvider(object: emoji as NSString) }
                    }
                }
            }
        }
    }
}
