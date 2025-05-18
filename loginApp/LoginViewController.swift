//
//  ViewController.swift
//  loginApp
//
//  Created by Leonid on 16.05.2025.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let correctUsername = "Leonid"
    private let correctPassword = "111"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
        setupTapGesture()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeVC = segue.destination as? HomeViewController
        homeVC?.nameLabelTF = "Welcome, \(usernameTextField.text ?? "User")!"
    }

    @IBAction func loginButtonAction() {
        guard isValidCredentials() else {
            showAlertInvalidCredentials(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
                
            )
            return
        }
    }
    
    @IBAction func forgotUsernameButtonAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is Leonid 😉")
    }
    
    @IBAction func forgotPasswordButtonAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is 111 🤫")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func isValidCredentials() -> Bool {
        usernameTextField.text == correctUsername && passwordTextField.text == correctPassword
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showAlertInvalidCredentials(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

