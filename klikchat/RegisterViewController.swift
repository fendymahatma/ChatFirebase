//
//  RegisterViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/25/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

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
    
    // Bikin Button nya untuk register
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 37, g: 163, b: 103)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        //set action untuk login
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
        return button
    }()
    
    func handleRegister() {
        guard let email = emailTextField.text else {
            print("form is not valid")
            return
        }
        guard let password = passwordTextField.text else {
            print("form is not valid")
            return
        }
        guard let name = nameTextField.text else {
            print("form is not valid")
            return
        }
        guard let phone = phoneTextField.text else {
            print("form is not valid")
            return
        }
    
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user:FIRUser?, error) in
            
            if error != nil {
                print(error.debugDescription)
                return
            }
            
            // Sampai sini Auth ke Firebase sukses dilakukan
            // Sekarang masukkan ke database
            
            guard let uid = user?.uid else{
                return
            }
            
            let ref = FIRDatabase.database().reference(fromURL: "https://klikchat-10516.firebaseio.com/")
            let userRefrence = ref.child("user").child(uid)
            let values = ["name": name, "email": email, "phone": phone, "password": password]
            userRefrence.updateChildValues(values, withCompletionBlock: {(err, ref) in
                
                if err != nil {
                    print(err.debugDescription)
                    return
                }
                
                //sukses simpen ke db
                self.dismiss(animated: true, completion: nil)
                print("sukses masukkan data ke database")
                
            })
        })
        
    }
    
    // Bikin Button nya untuk ke halaman register
    lazy var goToLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 37, g: 163, b: 103)
        button.setTitle("Already have account? Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        //set action ke register page
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return button
    }()
    
    func handleLogin() {
        
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    // Bikin textfiled (name)
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "User Name"
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
        
    }()
    
    let nameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Bikin textfiled (email)
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
        
    }()
    
    let emailSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Bikin textfiled (phone)
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Phone Number"
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = UIKeyboardType.numberPad
        return tf
        
    }()
    
    let phoneSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Bikin textfiled (password)
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.font = UIFont.systemFont(ofSize: 11)
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
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
        view.addSubview(registerButton)
        setupLoginButton()
        
        // Munculkan View Button dan jalankan fungsi setup lokasi nya
        view.addSubview(goToLoginButton)
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
        inputContainerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSeparator)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(emailSeparator)
        inputContainerView.addSubview(phoneTextField)
        inputContainerView.addSubview(phoneSeparator)
        inputContainerView.addSubview(passwordTextField)
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (username)
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (pemisah nama)
        nameSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSeparator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (email)
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (pemisah email)
        emailSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSeparator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (phone number)
        phoneTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (pemisah phone number)
        phoneSeparator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        phoneSeparator.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor).isActive = true
        phoneSeparator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        phoneSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // fungsi ini dibuat untuk menentukan posisi x: y: width: height: (password)
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
    }
    
    
    func setupLoginButton() {
        // x: y: width: height:
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        registerButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupGoToRegisterButton() {
        // x: y: width: height:
        goToLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToLoginButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        goToLoginButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        goToLoginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupIconKlikChat() {
        //Constraints :  need x,y, width and height
        iconKlikChat.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconKlikChat.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -20).isActive = true
        iconKlikChat.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iconKlikChat.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

