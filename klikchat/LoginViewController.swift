//
//  LoginViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/25/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    // Bikin Container buat textField
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.masksToBounds = true
        return view
    }()
    
    // Bikin Button nya untuk login
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 37, g: 163, b: 103)
        button.setTitle("LOG IN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        //set action untuk login
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return button
    }()
    
    func handleLogin() {
        guard let password = passwordTextField.text else {
            print("form is not valid")
            return
        }
        guard let name = nameTextField.text else {
            print("form is not valid")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: name, password: password, completion: {(user, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
        })
    }
    
    // Bikin Button nya untuk ke halaman register
    lazy var goToRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 37, g: 163, b: 103)
        button.setTitle("Don't have any account? Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        //set action ke register page
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
        return button
    }()
    
    func handleRegister() {
        
        let registerViewController = RegisterViewController()
        present(registerViewController, animated: true, completion: nil)
    }
    
    // Bikin textfiled
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email / Username"
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        return tf
        
    }()
    
    let nameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.isSecureTextEntry = true
        return tf
        
    }()
    
    let iconKlikChat: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "klikchat_logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Edit background color nya
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        // Munculkan View Constractor dan jalankan fungsi setup lokasi nya
        view.addSubview(inputContainerView)
        setupInputContainerView()
        
        // Munculkan View Button dan jalankan fungsi setup lokasi nya
        view.addSubview(loginButton)
        setupLoginButton()
        
        // Munculkan View Button dan jalankan fungsi setup lokasi nya
        view.addSubview(goToRegisterButton)
        setupGoToRegisterButton()
        
        // Munculkan Icon Image
        view.addSubview(iconKlikChat)
        setupIconKlikChat()
        
    }
    
    func setupInputContainerView() {
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (container)
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSeparator)
        inputContainerView.addSubview(passwordTextField)
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (username)
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (pemisah)
        nameSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSeparator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (container)
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
    
    func setupLoginButton() {
        // x: y: width: height:
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupGoToRegisterButton() {
        // x: y: width: height:
        goToRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToRegisterButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        goToRegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        goToRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupIconKlikChat() {
        //Constraints :  need x,y, width and height
        iconKlikChat.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconKlikChat.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -20).isActive = true
        iconKlikChat.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iconKlikChat.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// Bikin extension biar kalo nulis UIColor ga perlu (red: r/255, green: g/255, blue: b/255, alpha: 1)
extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
