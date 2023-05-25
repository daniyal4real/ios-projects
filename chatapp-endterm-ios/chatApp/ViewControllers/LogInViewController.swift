//
//  LogInViewController.swift
//  chatApp
//
//  Created by Daniyal on 18.02.2021.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("Could not log in", error)
            } else {
                print("Logged in")
                self.performSegue(withIdentifier: "loginToChat", sender: self)
            }
        }
        
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
    }
    
}
