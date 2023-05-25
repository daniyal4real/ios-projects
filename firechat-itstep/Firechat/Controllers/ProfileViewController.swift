//
//  ProfileViewController.swift
//  Firechat
//
//  Created by dan on 02.03.2023.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["Выйти"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}







extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(
            title: "",
            message: "",
            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(
            title: "Выйти",
            style: .destructive,
            handler: { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                
                do {
                    try FirebaseAuth.Auth.auth().signOut()
                    
                    let vc = LoginViewController()
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    strongSelf.present(nav, animated: true)
                }
                
                catch {
                    print("Ошибка при выходе")
                }
            }))
        actionSheet.addAction(UIAlertAction(
            title: "Отменить",
            style: .cancel,
            handler: nil))
        present(actionSheet, animated: true)
    }
}
