//
//  RichTextNote.swift
//  RichNotes
//
//  Created by Silvia Caraballo Fernandez on 16/12/25.
//

import Foundation
import SwiftData

@Model
class RichTextNote {
    var text: AttributedString
    var createdOn: Date
    var updatedOn: Date
    var category: Category?
    
    init(text: AttributedString, createdOn: Date = Date.now, updatedOn: Date = Date.now) {
        self.text = text
        self.createdOn = createdOn
        self.updatedOn = updatedOn
    }
    
    static var sample: RichTextNote = RichTextNote(text: "some sample text")
}
