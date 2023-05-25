//
//  LoginViewController.swift
//  Chatapp
//
//  Created by dan on 15.03.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("Ошибка логина \(String(describing: error))")
            } else {
                print("Вошли в аккаунт")
                self.performSegue(withIdentifier: "toChat", sender: self)
            }
        }
    }
    

}
