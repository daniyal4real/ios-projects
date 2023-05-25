//
//  ProductCell.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit
import Firebase
import FirebaseStorage


class ProductCell: UITableViewCell {
    
    public static let identifier = "ProductCell"

    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    
    @IBOutlet weak var productButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productName.contentMode = .scaleToFill
        productName.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        let shopDB = Database.database().reference().child("cart")
        guard let name = productName.text else { return }
        guard let price = productPrice.text else { return }
        guard let imageData = productImage.image?.pngData() else { return }
        let ID = NSUUID().uuidString
        
        Storage.storage().reference().child("images/\(name)").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("ERROR")
                return
            }
        })
        var GLOBALID = ""
        let productList: [String: String] = ["Название" : name, "Цена": price, "Фото": name, "ID": ID]
        
        shopDB.child(ID).setValue(productList) { (error, reference) in
            if error != nil {
                print(error!)
            }
            GLOBALID = reference.key ?? "DEFAULT"
        }
        print("GLOBAL ID \(GLOBALID)")
    }
}
