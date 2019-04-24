//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Nelson Gonzalez on 4/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteLabel: UILabel!
    
    weak var delegate: NoteTableViewCellDelegate?
    
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
        
        delegate?.shareNote(for: self)
        
    }
    
}
