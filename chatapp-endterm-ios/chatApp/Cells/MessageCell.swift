//
//  MessageCell.swift
//  chatApp
//
//  Created by Daniyal on 22.02.2021.
//

import UIKit

class MessageCell: UITableViewCell {
    
    public static let identifier: String = "MessageCell"

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
    }
}
