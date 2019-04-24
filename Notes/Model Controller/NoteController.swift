//
//  NoteController.swift
//  Notes
//
//  Created by Nelson Gonzalez on 4/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
class NoteController {
    
    var notes: [Note] = [] //Array of notes
    
    func createNote(with text: String) {
        
        let newNote = Note(text: text)
        
        notes.append(newNote)
    }
    
}
