//
//  ImageCell.swift
//  Snappy
//
//  Created by dan on 20.03.2023.
//
import UIKit
import SnapKit


class ImageCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Ошибка инициализаций")
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(140)
            make.edges.equalToSuperview().inset(5)
        }
    }
    
    
    func configure(image: UIImage?) {
        imageView.image = image
    }
}
