//
//  ContentCell.swift
//  tables
//
//  Created by dan on 25.04.2023.
//

import UIKit

class ContentCell: UITableViewCell {

    
    public static let identifier = "ContentCell"
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
