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
            
        }
    }
}

#Preview {
    RichTextEditorView()
}
