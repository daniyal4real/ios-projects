import UIKit
import Firebase
import Photos
import FirebaseStorage

class ChatViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var sendImageButton: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    private var messagesArray: [MessageEntity] = []
    private let storage = Storage.storage().reference()
    private var imageURL: String = ""
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveBackInputTextField))
        tableView.addGestureRecognizer(tapGesture)
        tableView.register(UINib(nibName: MessageCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MessageCell.identifier)
        tableView.register(UINib(nibName: MessageImageCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: MessageImageCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        inputTextField.delegate = self
        
        sendButton.layer.cornerRadius = 4
        sendButton.layer.masksToBounds = true
        
        sendImageButton.layer.contents = 4
        sendImageButton.layer.masksToBounds = true
    
        retrieveMessages()
    }
    

   
    @IBAction func logOutButtonPressed(_ sender: Any) {
        do {
            print("Logged out successfully")
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error)
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        sendButton.isEnabled = true
        
        let messagesDB = Database.database().reference().child("Messages")
        guard let email = Auth.auth().currentUser?.email else { return }
        guard let message = inputTextField.text else { return }
        let urlImage: String = self.imageURL
    
        if  message.isEmpty == true && imageURL.isEmpty == true{
                return
        } else {
            let messagesDict: [String: String] = ["sender": email, "message": message, "imageURL": urlImage]
            messagesDB.childByAutoId().setValue(messagesDict) { (error, reference) in
                if error != nil {
                    print(error!)
                } else {
                    self.sendButton.isEnabled = true
                    self.inputTextField.text = ""
                    
                }
            }
            self.imageURL = ""
        }
    }
    
    

    
    @IBAction func sendImageButtonPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        let fileName = NSUUID().uuidString
        storage.child("images/\(fileName)").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            
            self.storage.child("images/\(fileName)").downloadURL(completion: { url, error in
                guard let url = url , error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                self.imageURL = url.absoluteString
                print("Image's URL: ", self.imageURL)
                UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    


    
    @objc func moveBackInputTextField() {
        inputTextField.endEditing(true)
    }
    
    
    func retrieveMessages() {
        let messagesDB = Database.database().reference().child("Messages")
        
        messagesDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as? [String: String]
            guard let sender = snapshotValue?["sender"] else { return }
            guard let message = snapshotValue?["message"] else { return }
            self.messagesArray.append(MessageEntity(sender: sender, message: message, imageURL: self.imageURL))
            self.tableView.reloadData()
            self.scrollToLastMessage()
        }
    }
    
    
    func scrollToLastMessage() {
        let indexPath = IndexPath(row: messagesArray.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.heightConstraint.constant = 50 + 300
            self.view.layoutIfNeeded()
        }
        scrollToLastMessage()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
        scrollToLastMessage()
    }
 
}

extension ChatViewController: UITableViewDelegate {
    
}



extension ChatViewController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if messagesArray[indexPath.row].message.isEmpty == false  {
            let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as! MessageCell
            let message = messagesArray[indexPath.row]
            if Auth.auth().currentUser?.email == message.sender {
                cell.containerView.backgroundColor = .systemGreen
            } else {
                cell.containerView.backgroundColor = .systemBlue
            }
            
            cell.senderNameLabel.text = message.sender
            cell.messageLabel.text = message.message
            return cell
        
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MessageImageCell.identifier, for: indexPath) as! MessageImageCell
            let message = messagesArray[indexPath.row]
            if Auth.auth().currentUser?.email == message.sender {
                cell.containerView.backgroundColor = .systemGreen
            
            } else {
                cell.containerView.backgroundColor = .systemBlue
            }
            cell.senderNameLabel.text = message.sender
            
            return cell
            
           
        }
    }
}
