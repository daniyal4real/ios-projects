//
//  ItemCell.swift
//  todolist
//
//  Created by dan on 20.03.2023.
//

import UIKit

class ItemCell: UITableViewCell {

    public static let identifier = "ItemCell"
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
