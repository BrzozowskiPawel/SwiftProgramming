//
//  PlaceTableViewCell.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 07/12/2021.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    var place: Place?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func showPlace(place_: Place) {
        
        self.place = place_
        
        nameLabel.text = place_.name
    }
}
