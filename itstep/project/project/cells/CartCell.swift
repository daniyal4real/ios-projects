//
//  CartCell.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit
import Firebase

class CartCell: UITableViewCell {

    
    var buttonTapHandler: (() -> Void)?
    weak var delegate: CustomCellDelegete?
    
    
    public static let identifier = "CartCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var productAmount: UILabel!
    @IBOutlet weak var deletButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    var id = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func minusPressed(_ sender: Any) {
        let amount = (Int(productAmount.text!) ?? 0) - 1
        if amount < 0 || Int(productAmount.text!)! < 0 {
            return
        }
        self.productAmount.text = String(amount)
    }
    
    @IBAction func plusPressed(_ sender: Any) {
        let amount = (Int(productAmount.text!) ?? 0) + 1
        if amount > 99 || Int(productAmount.text!)! > 99 {
            return
        }
        self.productAmount.text = String(amount)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        let db = Database.database().reference().child("cart").child(id)
        db.removeValue { error, _ in
            if error != nil {
                print("Ошибка при удалений")
            } else {
                print("Товар удален")
            }
        }
        delegate?.didTapButtonInCell(self)
    }
    

    @IBAction func buyPressed(_ sender: Any) {
    }
    
    
}
