//
//  ViewController.swift
//  sql_practice
//
//  Created by dan on 27.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var db = DBManager()
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ContactCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ContactCell.identifier)        
        people = db.read()
        tableView.reloadData()
    }

    
    @IBAction func plusPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactViewController") as? ContactViewController {
            contactVC.id = people.count
            navigationController?.pushViewController(contactVC, animated: true)
        }
        self.tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as! ContactCell
        cell.nameLabel.text = people[indexPath.row].name
        cell.phoneLabel.text = people[indexPath.row].phone
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var localID = indexPath.row
//        let contactVC = ContactViewController()
//        contactVC.testID = localID
//        self.performSegue(withIdentifier: "toSecond", sender: self)
//        print("Принт сработал \(localID)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let updateVC = storyboard.instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController {
            updateVC.id = people.count
            updateVC.name = people[indexPath.row].name
            updateVC.phone = people[indexPath.row].phone
            navigationController?.pushViewController(updateVC, animated: true)
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Удалить") { [self] (action, sourceView, handler) in
            self.db.deleteByID(id: indexPath.row)
            self.people.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        swipeAction.performsFirstActionWithFullSwipe = true
        
        self.tableView.reloadData()
        return swipeAction
    }

    
    
    
}

