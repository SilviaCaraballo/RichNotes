//
//  MoreFormattingView.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 11/12/25.
//

import SwiftUI

struct MoreFormattingView: View {
    @Environment(\.fontResolutionContext) var fontResolutionContext
    @Binding var text: AttributedString
    @Binding var selection: AttributedTextSelection
    @State private var color = Color.primary
    var body: some View {
        var selCopy = selection
        let states = SelectionState.selectionStyleState(text: text, selection: &selCopy) { font in
            let resolved = font.resolve(in: fontResolutionContext)
            return (resolved.isBold, resolved.isItalic)
        }

        return VStack(alignment: .leading) {
            Text("Format")

            ScrollView(.horizontal) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Button("Extra Large") {
                        text.transformAttributes(in: &selection) { container in
                            container.font = .title
                        }
                    }
                    .font(.title)
                    .padding(.horizontal, 5)

                    Button("Large") {
                        text.transformAttributes(in: &selection) { container in
                            container.font = .title2
                        }
                    }
                    .font(.title2)
                    .padding(.horizontal, 5)

                    Button("Medium") {
                        text.transformAttributes(in: &selection) { container in
                            container.font = .title3
                        }
                    }
                    .font(.title3)
                    .padding(.horizontal, 5)

                    Button("Body") {
                        text.transformAttributes(in: &selection) { container in
                            container.font = .body
                        }
                    }
                    .font(.body)
                    .padding(.horizontal, 5)

                    Button("FootNote") {
                        text.transformAttributes(in: &selection) { container in
                            container.font = .footnote
                        }
                    }
                    .font(.footnote)
                    .padding(.horizontal, 5)
                }
            }

            ScrollView(.horizontal) {
                HStack {
                    FormatStyleButtons(text: $text, selection: $selection)

                    Button {
                        text.transformAttributes(in: &selection) { container in
                            container.alignment = .left
                        }
                    } label: {
                        Image(systemName: "text.alignleft")
                    }
                    .frame(width: 40, height: 40)
                    .selectBackground(state: SelectionState.isSelected(for: states.leftAlignment))

                    Button {
                        text.transformAttributes(in: &selection) { container in
                            container.alignment = .center
                        }
                    } label: {
                        Image(systemName: "text.aligncenter")
                    }
                    .frame(width: 40, height: 40)
                    .selectBackground(state: SelectionState.isSelected(for: states.centerAlignment))

                    Button {
                        text.transformAttributes(in: &selection) { container in
                            container.alignment = .right
                        }
                    } label: {
                        Image(systemName: "text.alignright")
                    }
                    .frame(width: 40, height: 40)
                    .selectBackground(state: SelectionState.isSelected(for: states.rightAlignment))

                    ColorPicker("Text Color", selection: $color)
                        .labelsHidden()
                        .frame(width: 40, height: 40)
                }
                .font(.system(size: 22))
            }

            Button("Remove Formatting") {
                text.transformAttributes(in: &selection) { container in
                    container = AttributeContainer()
                }
            }
            .buttonStyle(.bordered)
        }
        .buttonStyle(.plain)
        .padding()
        .onChange(of: color) { _, newColor in
            text.transformAttributes(in: &selection) { container in
                container.foregroundColor = newColor
            }
        }
    }
}

#Preview {
    MoreFormattingView(text: .constant(""), selection: .constant(AttributedTextSelection()))
        .frame(width: 40, height: 40)
}
