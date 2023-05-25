//
//  MenuCell.swift
//  bitcoinApp
//
//  Created by Daniyal on 15.02.2021.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    public static let identifier: String = "MenuCell"
    
    override var isSelected: Bool {
        didSet {
            if isSelected == true {
                nameLabel.textColor = .white
            } else {
                nameLabel.textColor = .darkGray
            }
        }
    }
    
    let nameLabel: UILabel = {
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
        fatalError("init(coder: ) has not been implemented")
    }
    
}
