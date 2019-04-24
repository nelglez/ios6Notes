//
//  NotesViewController.swift
//  Notes
//
//  Created by Nelson Gonzalez on 4/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notesTextView: UITextView!
    
    let noteController = NoteController() //Manage the content
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.delegate = self
       tableView.dataSource = self
    }
    

   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            guard let destinationVC = segue.destination as? NoteDetailViewController, let cell = sender as? NoteTableViewCell else {return}
            
            destinationVC.note = cell.note
            
        }
    }
   
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        //Get text if its present
        //Create a new note
        
        //update the display
        
        guard let text = notesTextView.text, !text.isEmpty else { return }
        
        noteController.createNote(with: text)
        
        tableView.reloadData()
        
        notesTextView.text = nil
        
    }
    
}

extension NotesViewController: UITableViewDelegate {
    
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else {return cell}
        
        //Get the note for row
        let note = noteController.notes[indexPath.row]
        
        noteCell.note = note
        noteCell.delegate = self
        
        return cell
    }
   
    
}

extension NotesViewController: NoteTableViewCellDelegate {
    
    func shareNote(for cell: NoteTableViewCell) {
      // print("Share note: \(cell.note)")
        
        guard let note = cell.note else { return }
        
        //grab text
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        present(activityController, animated: true, completion: nil)
    }
    
}
