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
    var body: some View {
        NavigationStack{
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
                    }
                } else {
                    ContentUnavailableView("Create your first note", systemImage: "square.and.pencil")
                }
                
            }
                .navigationTitle("Rich Notes")
                .toolbarTitleDisplayMode(.inlineLarge)
                .navigationDestination(for: RichTextNote.self) { note in
                    
                }
        }
    }
}

#Preview (traits: .mockData){
    NotesView()
}
