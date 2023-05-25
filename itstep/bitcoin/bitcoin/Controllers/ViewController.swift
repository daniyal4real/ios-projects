//
//  ViewController.swift
//  bitcoin
//
//  Created by dan on 03.04.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    private let colors: [UIColor] = [.blue, .brown, .green]
    private let titles: [String] = ["BTC", "KRW", "ETH"]
    
    private var leftAnchorOfHorizontalSlider: NSLayoutConstraint?
    private var contextOffsetX: CGFloat = 0
    
    var leftAnchorOfHorizontalSliderConstant: CGFloat? {
        didSet {
            if let leftAnchorConstant = leftAnchorOfHorizontalSliderConstant {
                leftAnchorOfHorizontalSlider?.constant = leftAnchorConstant / CGFloat(menuCollectionView.numberOfItems(inSection: 0))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Биткойны"
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        
        
        menuCollectionView.isPagingEnabled = true
        menuCollectionView.alwaysBounceHorizontal = false
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.isScrollEnabled = false
        
        
        mainCollectionView.isPagingEnabled = true
        mainCollectionView.alwaysBounceHorizontal = false
        mainCollectionView.showsHorizontalScrollIndicator = false
        mainCollectionView.bounces = false
        
        mainCollectionView.register(UINib(nibName: MainCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: MainCell.identifier)
        
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        
        horizontalSliderSetup()
    }
    
    
    func horizontalSliderSetup() {
        let horizontalSlider = UIView()
        horizontalSlider.backgroundColor = .red
        horizontalSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalSlider)
        
        horizontalSlider.bottomAnchor.constraint(equalTo: menuCollectionView.bottomAnchor).isActive = true
        horizontalSlider.heightAnchor.constraint(equalToConstant: 4).isActive = true
        horizontalSlider.widthAnchor.constraint(equalTo: menuCollectionView.widthAnchor, multiplier: 1 / 3).isActive = true
        
        leftAnchorOfHorizontalSlider = horizontalSlider.leftAnchor.constraint(equalTo: menuCollectionView.leftAnchor)
        leftAnchorOfHorizontalSlider?.isActive = true
        
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        contextOffsetX = scrollView.contentOffset.x
        leftAnchorOfHorizontalSliderConstant = contextOffsetX
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / mainCollectionView.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        mainCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            return 3
        } else {
            return 3
        }
//        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
            cell.nameLabel.text = titles[indexPath.row]
//            cell.contentView.backgroundColor = colors[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as! MainCell
//            cell.contentView.backgroundColor = colors[indexPath.row]
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView {
            return CGSize(width: menuCollectionView.frame.width / 3, height: menuCollectionView.frame.height)
        } else {
            return CGSize(width: mainCollectionView.frame.width, height: mainCollectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
