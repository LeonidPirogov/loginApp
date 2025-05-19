//
//  HomeViewController.swift
//  loginApp
//
//  Created by Leonid on 17.05.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        nameLabel.text = "Welcome, \(userName ?? "User")!"
        
    }
    
    private func setBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.85, green: 0.44, blue: 0.56, alpha: 1.0).cgColor,
            UIColor(red: 0.70, green: 0.81, blue: 0.98, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
