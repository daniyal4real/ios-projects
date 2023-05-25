//
//  ContactViewController.swift
//  sql_practice
//
//  Created by dan on 27.03.2023.
//

import UIKit

class ContactViewController: UIViewController {

    
    public var id = 0
    public var testID = 0
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TEST ID \(testID)")
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        
        let vc = ViewController()
        let nameData = nameField.text
        let phoneData = phoneField.text
        vc.db.insert(id: id + 1, name: nameData!, phone: phoneData!)
        self.performSegue(withIdentifier: "back", sender: self)
    }
    

}
