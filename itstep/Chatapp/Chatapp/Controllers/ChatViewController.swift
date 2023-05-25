//
//  ViewController.swift
//  Chatapp
//
//  Created by dan on 15.03.2023.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var messages: [MessageEntity] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MessageCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MessageCell.identifier)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        getMessages()
    }
    
    func getMessages() {
        let messageDB = Database.database().reference().child("Messages")
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as? [String: String]
            guard let sender = snapshotValue?["отправитель"] else { return }
            guard let message = snapshotValue?["сообщение"] else { return }
            self.messages.append(MessageEntity(sender: sender, message: message))
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as! MessageCell
        cell.senderName.text = messages[indexPath.row].sender
        cell.messageLabel.text = messages[indexPath.row].message
        
        if cell.senderName.text == "alfa.gentlemen@mail.ru" {
            cell.avatarImage.tintColor = .systemGreen
            cell.containerView.tintColor = .systemGreen
            cell.containerView.backgroundColor = .systemGreen
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        
        sendButton.isEnabled = true
        
        let messageDB = Database.database().reference().child("Messages")
//        guard let name = Auth.auth().currentUser?.email else { return }
        guard let name = Auth.auth().currentUser?.email else { return }
        guard let message = inputField.text else { return }
        
        if message.isEmpty {
            return
        } else {
            let messageDict: [String: String] = ["отправитель": name, "сообщение": message]
            messageDB.childByAutoId().setValue(messageDict) { (error, reference) in
                if error != nil {
                    print(error ?? "Error")
                } else {
                    self.sendButton.isEnabled = true
                    self.inputField.text = ""
                }
            }
        }
    }
}

