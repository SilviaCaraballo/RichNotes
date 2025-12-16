//
//  MockData.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 16/12/25.
//

import SwiftUI
import SwiftData

struct MockData: PreviewModifier {
    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }
    
    static func makeSharedContext() async throws -> ModelContainer {
        do {
            let container = try ModelContainer(for: Category.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            let todo = Category(name:"ToDo", hexColor: "0000FF")
            container.mainContext.insert(todo)
            let important = Category(name:"important", hexColor: "FF0000")
            container.mainContext.insert(important)
            let note = RichTextNote.sample
            important.notes.append(note)
            return container
        } catch {
            fatalError()
        }
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    static var mockData: Self = .modifier(MockData())
}
