//
//  ItemCell.swift
//  todo
//
//  Created by dan on 20.03.2023.
//

import UIKit

class ItemCell: UITableViewCell {
    
    public static let identifier: String = "ItemCell"
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
