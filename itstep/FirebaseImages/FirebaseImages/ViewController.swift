//
//  ViewController.swift
//  FirebaseImages
//
//  Created by dan on 20.03.2023.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changePhotoTapped))
        imageView.addGestureRecognizer(gesture)
       
    }
    
    override func viewDidLayoutSubviews() {
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    }
    
    @objc func changePhotoTapped() {
        let actionSheet = UIAlertController(title: "Фото", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Сделать фото", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Выбрать", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
            let fileName = NSUUID().uuidString
            Storage.storage().reference().child("images/\(fileName)").putData(imageData, metadata: nil, completion: { _, error in
                guard error == nil else {
                    print("ERROR")
                    return
            }
                
            Storage.storage().reference().child("images/\(fileName)").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                print("URL Картинки \(urlString)")
            })
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    func presentCamera() {
        print("Method called")
    }
    
    func presentPhotoPicker() {
        print("Method called")
    }


}

