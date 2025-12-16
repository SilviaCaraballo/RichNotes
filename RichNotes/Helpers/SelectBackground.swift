//
//  SelectBackground.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 14/12/25.
//

import SwiftUI

struct SelectBackground: ViewModifier {
    let state: Bool
    let isbutton: Bool
    
    func body(content: Content) -> some View {
        if state {
            if isbutton {
                content
                    .foregroundStyle(.white)
                    .background(.tint, in: .circle)
            } else {
                content
                    .foregroundStyle(.white)
                    .background(.tint, in: .rect(cornerRadius: 8))
            }
        } else {
            content
        }
    }
}
 extension View {
    func selectBackground(state: Bool, isbutton: Bool = true) -> some View {
        modifier(SelectBackground(state: state, isbutton: isbutton))
    }
}
