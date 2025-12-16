//
//  File.swift
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
            return container
        } catch {
            fatalError()
        }
    }
}
