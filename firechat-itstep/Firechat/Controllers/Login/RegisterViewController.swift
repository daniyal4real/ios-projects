//
//  RegisterViewController.swift
//  Firechat
//
//  Created by Daniyal Ganiuly on 22.02.2023.
//

import UIKit
import FirebaseAuth
import JGProgressHUD


class RegisterViewController: UIViewController {
    
    private let spinner = JGProgressHUD(style: .dark)
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
//        imageView.layer.cornerRadius = 65
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email"
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 5,
                                              height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Имя"
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 5,
                                              height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Фамилия"
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 5,
                                              height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Пароль"
        field.leftView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 5,
                                              height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Создать аккаунт", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Регистрация"
        view.backgroundColor = .white
        
        
        view.addSubview(imageView)
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        

        emailField.delegate = self
        passwordField.delegate = self
        
        
        let gesture = UIGestureRecognizer(
            target: self,
            action: #selector(didTapChangeProfilePic)
        )
        imageView.addGestureRecognizer(gesture)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        
    }
    
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Создание аккаунта"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        let size = view.frame.size.width / 3
//        imageView.frame = CGRect(x: (view.frame.width - size) / 2,
//                                 y: 40,
//                                 width: size,
//                                 height: size)
        
        
        let size =  view.width / 3
        imageView.frame = CGRect(
        x: (view.width - size) / 2,
        y: 20,
        width: size,
        height: size)
        
        
        scrollView.frame = view.bounds
        
        firstNameField.frame = CGRect(
            x: 30,
            y: imageView.bottom + 10,
            width: scrollView.width - 60,
            height: 50
        )
        
        
        lastNameField.frame = CGRect(
            x: 30,
            y: firstNameField.bottom + 10,
            width: scrollView.width - 60,
            height: 50
        )
        
        emailField.frame = CGRect(
            x: 30,
            y: lastNameField.bottom + 10,
            width: scrollView.width - 60,
            height: 50
        )
        
        passwordField.frame = CGRect(
            x: 30,
            y: emailField.bottom + 10,
            width: scrollView.width - 60,
            height: 50
        )
        
        registerButton.frame = CGRect(
            x: 30,
            y: passwordField.bottom + 10,
            width: scrollView.width - 60,
            height: 50)
    }
    
    
    @objc private func registerButtonTapped() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
                
              !email.isEmpty,
              !password.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              password.count >= 6 else {
                  alertUserLoginError()
                  return
              }
        
        spinner.show(in: view)
        
        
        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exists in
            guard let strongSelf = self else {
                return
            }
            
            DispatchQueue.main.async {
                strongSelf.spinner.dismiss()
            }
            
            guard !exists else {
                strongSelf.alertUserLoginError(message: "Аккаунт с этим email уже существует")
                return
            }
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                guard authResult != nil, error == nil else {
                    print("Ошибка при регистаций")
                    return
                }
            
                DatabaseManager.shared.insertUser(with: ChatAppUser(
                    firstName: firstName,
                    lastName: lastName,
                    emailAddress: email))
                
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
            })
        })
    }
    
    func alertUserLoginError(message: String = "Пожалуйста, введите все данные") {
        let alert = UIAlertController(title: "Ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отменить",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true)
    }

}



extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            registerButtonTapped()
        }
        return true
    }
}



extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(
            title: "Фото профиля",
            message: "Выберите фото",
            preferredStyle: .actionSheet
        )
        actionSheet.addAction(UIAlertAction(
        title: "Отменить",
        style: .cancel,
        handler: nil
        ))
        actionSheet.addAction(UIAlertAction(
            title: "Сделать фото",
            style: .default,
            handler: { [weak self] _ in
                self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(
        title: "Выбрать",
        style: .default,
        handler: { [weak self]_ in
            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
        print("Button pressed")
    }
    
    func presentCamera() {
        
    }
    
    func presentPhotoPicker() {
        
    }
}
