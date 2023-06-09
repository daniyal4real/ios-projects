//
//  MenuCell.swift
//  bitcoin
//
//  Created by dan on 03.04.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {

    
    public static let identifier = "MenuCell"
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected == true {
                nameLabel.textColor = .red
            } else {
                nameLabel.textColor = .darkGray
            }
        }
    }
    
    public let nameLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init выдал ошибку")
    }
    
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

}
