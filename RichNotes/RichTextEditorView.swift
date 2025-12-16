//
//  RichTextEditorView.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 9/12/25.
//

import SwiftUI

struct RichTextEditorView: View {
    @State private var text: AttributedString = ""
    @State private var selection = AttributedTextSelection()
    @State private var moreEditing = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $text, selection: $selection)
                .focused($isFocused)
                .padding()
                .scrollBounceBehavior(.basedOnSize)
                .navigationTitle("RichText Editor")
                .toolbarTitleDisplayMode(.inlineLarge)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Group {
                            FormatStyleButtons(text: $text, selection: $selection)
                            Spacer()
                            Button {
                                moreEditing.toggle()
                            } label: {
                                Image(systemName: "textformat.alt")
                            }
                            Button {
                                isFocused = false
                            } label: {
                                Image(systemName: "keyboard.chevron.compact.down")
                            }
                        }
                        .disabled(isFocused)
                    }
                }
                .sheet(isPresented: $moreEditing) {
                    MoreFormattingView(text: $text, selection: $selection)
                        .presentationDetents([.height(200)])
                }

        }
    }
}

#Preview {
    RichTextEditorView()
}
