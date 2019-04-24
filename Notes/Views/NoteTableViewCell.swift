//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Nelson Gonzalez on 4/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteLabel: UILabel!
    
    var note: Note? {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func updateViews() {
        guard let note = note else { return }
        noteLabel.text = note.text
    }
   
    @IBAction func shareButtonPressed(_ sender: UIButton) {
    }
    
}
