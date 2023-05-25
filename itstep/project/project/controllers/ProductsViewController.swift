//
//  ViewController.swift
//  project
//
//  Created by dan on 29.03.2023.
//

import UIKit
import Alamofire
import Kingfisher

class ProductsViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    var products: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ProductCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ProductCell.identifier)
//        tableView.reloadData()
        showProducts()
    }
    
    func showProducts() {
        let url = "https://fakestoreapi.com/products"
        
        AF.request(url).response { response in
            if let data = response.data {
                do {
                    let productsList = try JSONDecoder().decode([Product].self, from: data)
                    self.products = productsList
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Ошибка \(error.localizedDescription)")
                }
            }
        }
    }
}


extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        let imageURL = URL(string: products[indexPath.row].image)
        cell.productImage.kf.indicatorType = .activity
        cell.productImage.kf.setImage(with: imageURL)
        cell.productImage.contentMode = .scaleAspectFill
        cell.productImage.clipsToBounds = true
        cell.productName.text = products[indexPath.row].title
        let priceTG = products[indexPath.row].price * 450
        cell.productPrice.text = "\(priceTG) тг"
        print("PRODUCTS: \(self.products)")
        return cell
    }
    
    
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let productVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController {
            productVC.productID = products[indexPath.row].id
//            print(searchProducts[indexPath.row].id)
            navigationController?.pushViewController(productVC, animated: true)
        }
    }
}
