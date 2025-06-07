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
    
    private let user = User.getUser()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach { viewController in
            if let homeVC = viewController as? HomeViewController {
                homeVC.userLogin = user.login
                homeVC.userName = user.person.name
                homeVC.userSurName = user.person.surname
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as? PersonViewController
                personVC?.title = "\(user.person.name) \(user.person.surname)"
                personVC?.tabBarItem.title = "\(user.person.name) \(user.person.surname)"
                personVC?.personName = user.person.name
                personVC?.personSurname = user.person.surname
                personVC?.personAge = user.person.age
                personVC?.personCity = user.person.city
                personVC?.personHobby = user.person.hobby
                personVC?.personPhone = user.person.phone
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard usernameTextField.text == user.login, passwordTextField.text == user.password else {
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
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(user.login) 😉")
    }
    
    @IBAction func forgotPasswordButtonAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(user.password) 🤫")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

