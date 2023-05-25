//
//  CartViewController.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit
import Firebase
import FirebaseStorage
import Kingfisher


protocol CustomCellDelegete: AnyObject {
    func didTapButtonInCell(_ cell: CartCell)
}

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegete {
    
    func didTapButtonInCell(_ cell: CartCell) {
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var cartProducts: [Product2] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CartCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CartCell.identifier)
        getCart()
    }
    
    
    func getCart() {
        let db = Database.database().reference().child("cart")
        db.observe(.childAdded) { snapshot  in
            let data = snapshot.value as? [String: String]
            guard let name = data?["Название"] else { return }
            guard let image = data?["Фото"] else { return }
            guard let price = data?["Цена"] else { return }
            guard let id = data?["ID"] else { return }
            
            
            
            var temp: [Product2] = []
            
            
            temp.append(Product2(id: id, title: name, price: price, image: image, amount: 0))
                        
                        
            self.cartProducts = temp
                        
                        
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as! CartCell
        
        let storageReference = Storage.storage().reference(withPath: "images/\(self.cartProducts[indexPath.row].image)")
        storageReference.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
            if error != nil {
                print("Ошибка загрузки")
            }
            if let data = data {
                cell.productImage.contentMode = .scaleToFill
                cell.productImage.clipsToBounds = true
//                let url = URL(string: self.cartProducts[indexPath.row].image)
                cell.productImage.image = UIImage(data: data)
//                print("URL: \(String(describing: url))")
//                cell.productImage.image?.kf.setImage(with: url)
            }
        }
        cell.id = cartProducts[indexPath.row].id
        cell.productName.text = cartProducts[indexPath.row].title
        cell.productPrice.text = String(cartProducts[indexPath.row].price)
        let row = indexPath.row
        let intValue = Int(row)
        cell.delegate = self
        cell.deletButton.tag = indexPath.row
        cell.deletButton.addTarget(cell, action: #selector(cell.deletePressed(_:)), for: .touchUpInside)
//        self.cartProducts.remove(at: intValue)
//        cell.buttonTapHandler = { [weak self] in
//            let row = indexPath.row
//            self!.cartProducts.remove(at: row)
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let intValue = Int(row)
        self.cartProducts.remove(at: intValue)
        if let cell = tableView.cellForRow(at: indexPath) as? CartCell {
            cell.deletePressed(cell.deletButton!)
        }
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count 
    }

}
