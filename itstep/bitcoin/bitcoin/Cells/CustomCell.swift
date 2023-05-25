//
//  CustomCell.swift
//  bitcoin
//
//  Created by dan on 03.04.2023.
//

import UIKit

class CustomCell: UITableViewCell {
    
    public static let identifier = "CustomCell"

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var volumeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        titleLabel.text = "BTC"
        priceLabel.text = "100"
        volumeLabel.text = "255"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
