//
//  FormatStyleButtons.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 10/12/25.
//

import SwiftUI

struct FormatStyleButtons: View {
    @Environment(\.fontResolutionContext) var fontResolutionContext
    @Binding var text: AttributedString
    @Binding var selection: AttributedTextSelection
    var body: some View {
        var selCopy = selection
        let states = SelectionState.selectionStyleState(text: text, selection: &selCopy) { font in
            let resolved = font.resolve(in: fontResolutionContext)
            return (resolved.isBold,resolved.isItalic)
        }
        Button {
            text.transformAttributes(in: &selection) { container in
                let currentFont = container.font ?? .default
                let resolved = currentFont.resolve(in: fontResolutionContext)
//                                if resolved.isBold {
//                                    container.font = currentFont.bold(false)
//                                } else {
//                                    container.font = currentFont.bold(true)
//                                }
                container.font = currentFont.bold(!resolved.isBold)
            }
        } label: {
            Image(systemName: "bold")
        }
        .frame(width: 40, height: 40)
        .selectBackground(state: SelectionState.isSelected(for: states.bold))
        Button {
            text.transformAttributes(in: &selection) { container in
                let currentFont = container.font ?? .default
                let resolved = currentFont.resolve(in: fontResolutionContext)
                container.font = currentFont.bold(!resolved.isItalic)
            }
        } label: {
            Image(systemName: "italic")
        }
        .frame(width: 40, height: 40)
        .selectBackground(state: SelectionState.isSelected(for: states.italic))
        Button {
            text.transformAttributes(in: &selection) { container in
                if container.underlineStyle == .single {
                    container.underlineStyle = .none
                } else {
                    container.underlineStyle = .single
                }
            }
        } label: {
            Image(systemName: "underline")
        }
        .frame(width: 40, height: 40)
        .selectBackground(state: SelectionState.isSelected(for: states.underline))
        Button {
            text.transformAttributes(in: &selection) { container in
                if container.strikethroughStyle == .single {
                    container.strikethroughStyle = .none
                } else {
                    container.strikethroughStyle = .single
                }
            }
        } label: {
            Image(systemName: "strikethrough")
        }
        .frame(width: 40, height: 40)
        .selectBackground(state: SelectionState.isSelected(for: states.strikethrough))
        Spacer()

    }
}

#Preview {
    FormatStyleButtons(text: .constant(""), selection: .constant(AttributedTextSelection()))
}
