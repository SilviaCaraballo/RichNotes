//
//  NotesView.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 17/12/25.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    @Query private var notes: [RichTextNote]
    @Environment(\.modelContext) var context
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack (path: $path) {
            Group {
                if !notes.isEmpty {
                    List {
                        ForEach(notes) { note in
                            NavigationLink(value: note){
                                VStack (alignment: .leading) {
                                    Text(note.text)
                                    Text("Updated:\(Text(note.updatedOn, style: .date))\(Text(note.updatedOn, style: .time))")
                                    if let category = note.category {
                                        Text(category.name)
                                            .foregroundStyle(Color(hex: category.hexColor)!)
                                    }
                                }
                            }
                        }
                        .onDelete { indices in
                            for index in indices {
                                context.delete(notes[index])
                            }
                            try? context.save()
                        }
                    }
                } else {
                    ContentUnavailableView("Create your first note", systemImage: "square.and.pencil")
                }
                
            }
                .navigationTitle("Rich Notes")
                .toolbarTitleDisplayMode(.inlineLarge)
                .navigationDestination(for: RichTextNote.self) { note in
                    NotesEditorView(note: note)
                }
                .toolbar {
                    Button {
                        let newNote = RichTextNote(text: "")
                        context.insert(newNote)
                        path.append(newNote)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

#Preview (traits: .mockData){
    NotesView()
}
