//
//  NoteTableViewCell.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 08/12/2021.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNoteCell(note: Note) {
        dateLabel.text = note.date
        noteLabel.text = note.text
    }

}
