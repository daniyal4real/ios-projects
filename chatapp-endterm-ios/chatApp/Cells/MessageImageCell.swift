//
//  MessageImageCell.swift
//  chatApp
//
//  Created by Daniyal on 27.02.2021.
//

import UIKit

class MessageImageCell: UITableViewCell, UITableViewDelegate {
    
    public static let identifier: String = "MessageImageCell"

    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
        messageImageView.contentMode = .scaleAspectFill
        messageImageView.clipsToBounds = true 
        
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView?.contentMode = .scaleAspectFit
                self.imageView?.clipsToBounds = true
                self.messageImageView.image = image
            }
        })
        task.resume()
    }

}
