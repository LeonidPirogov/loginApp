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
    
    private let user = "Leonid"
    private let password = "111"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeVC = segue.destination as? HomeViewController
        homeVC?.userName = user 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password") {
                    self.passwordTextField.text = ""
                }
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
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
    
    private func showAlert(withTitle title: String, andMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

