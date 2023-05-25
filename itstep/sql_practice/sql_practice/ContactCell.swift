//
//  ContactCell.swift
//  sql_practice
//
//  Created by dan on 27.03.2023.
//

import UIKit

class ContactCell: UITableViewCell {

    
    public static let identifier = "ContactCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
