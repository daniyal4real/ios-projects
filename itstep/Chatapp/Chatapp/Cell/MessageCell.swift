//
//  MessageCell.swift
//  Chatapp
//
//  Created by dan on 15.03.2023.
//

import UIKit
import FirebaseAuth


class MessageCell: UITableViewCell {
    
    public static let identifier: String = "MessageCell"
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }

    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
