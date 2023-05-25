//
//  CustomCell.swift
//  bitcoinApp
//
//  Created by Daniyal on 15.02.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    public static let identifier: String = "CustomCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        titleLabel.text = "KRW"
        priceLabel.text = "100"
        volumeLabel.text = "300"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
