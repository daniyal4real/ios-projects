//
//  UpdateViewController.swift
//  sql_practice
//
//  Created by dan on 29.03.2023.
//

import UIKit

class UpdateViewController: UIViewController {

    
    public var id = 0
    public var name = ""
    public var phone = ""
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.text = name
        phoneField.text = phone
        
    }
    

    @IBAction func updatePressed(_ sender: Any) {
        let vc = ViewController()
        vc.db.updateByID(id: id, name: "nameField.text!", phone: "phoneField.text!")
//        print(nameField.text)
//        print(phoneField.text)
        self.performSegue(withIdentifier: "toBack", sender: self)
    }
    
}
