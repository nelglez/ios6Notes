//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Nelson Gonzalez on 4/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    @IBOutlet weak var noteTextView: UITextView!
    
    //Computed property
    var note: Note? {
        didSet {
            //anytime i make a change it will call update views
            updateViews()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       updateViews()
    }
    
    private func updateViews() {
        guard let note = note, isViewLoaded else { return }
        
        noteTextView.text = note.text
    }

    

}
