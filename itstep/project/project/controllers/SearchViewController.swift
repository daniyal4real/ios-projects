//
//  SearchViewController.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    var products: [Product] = []
    var searchProducts: [Product] = []
    private var searching: Bool = false
    private var productTitle: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        title = "Поиск"
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
        
        print(self.searchProducts)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var titleLabel = cell.contentView.viewWithTag(100) as? UILabel
        if titleLabel == nil {
            titleLabel = UILabel(frame: cell.contentView.bounds)
            titleLabel!.tag = 100
            titleLabel!.textAlignment = .left
            titleLabel!.textColor = .black
            titleLabel!.contentMode = .scaleAspectFit
            titleLabel!.numberOfLines = 0
            cell.contentView.addSubview(titleLabel!)
        }
        
        if searching {
            titleLabel?.text = searchProducts[indexPath.row].title
        } else {
            titleLabel?.text = products[indexPath.row].title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return self.searchProducts.count
        } else {
            return self.products.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var productID = 0
        if searching {
            productID = self.searchProducts[indexPath.row].id
        } else {
            productID = self.products[indexPath.row].id
        }
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let productVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController {
            productVC.productID = productID
//            print(searchProducts[indexPath.row].id)
            navigationController?.pushViewController(productVC, animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchProducts = products.filter({$0.title.lowercased().range(of: searchText.lowercased()) != nil})

        self.searching = true
        
        if searchText == "" {
            searching = false
        }
        self.tableView.reloadData()
    }
    
    
    

}
