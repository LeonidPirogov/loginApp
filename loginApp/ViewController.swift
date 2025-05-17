//
//  ViewController.swift
//  loginApp
//
//  Created by Leonid on 16.05.2025.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
    }
    
    @IBAction func loginButtonAction() {
        
    }
    
    
    @IBAction func forgotUsernameButtonAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is Leonid 😉")
    }
    
    @IBAction func forgotPasswordButtonAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is 111 🤫")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

