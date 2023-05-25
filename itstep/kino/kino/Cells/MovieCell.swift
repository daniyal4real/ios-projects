//
//  MovieCell.swift
//  kino
//
//  Created by dan on 04.05.2023.
//

import UIKit

class MovieCell: UITableViewCell {

    
    public static let identifier = "MovieCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var ratingContainer: UIView!
    @IBOutlet weak var overallRating: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        originalTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        originalTitleLabel.contentMode = .scaleToFill
        originalTitleLabel.numberOfLines = 0
        
        
        posterImageView.contentMode = .scaleToFill
        
        
        ratingContainer.layer.cornerRadius = 18
        ratingContainer.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
