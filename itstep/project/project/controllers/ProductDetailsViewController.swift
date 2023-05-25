//
//  ProductDetailsViewController.swift
//  project
//
//  Created by dan on 10.04.2023.
//

import UIKit
import Alamofire
import Kingfisher

class ProductDetailsViewController: UIViewController {

    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    
    var productID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(productID)
        productName.contentMode = .scaleAspectFit
        productName.numberOfLines = 0
        productDescription.contentMode = .scaleAspectFit
        productDescription.numberOfLines = 0
        productImage.layer.masksToBounds = true
        
        showProduct(productID: productID)
    }
    
    func showProduct(productID: Int) {
        let url = "https://fakestoreapi.com/products/"
        
        AF.request(url + "\(productID)").response { response in
            if let data = response.data {
                do {
                    let json = try JSONDecoder().decode(Product.self, from: data)
                    let url = URL(string: json.image)
                    self.productImage.kf.setImage(with: url)
                    self.productName.text = json.title
                    self.productRating.text = "\(json.rating.rate)"
                    self.productDescription.text = json.description
                    
                } catch {
                    print("Ошибка \(error.localizedDescription)")
                }
            }
        }
    }
}
