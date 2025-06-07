//
//  PersonViewController.swift
//  loginApp
//
//  Created by Leonid on 02.06.2025.
//

import UIKit

final class PersonViewController: UIViewController {

    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    var personName: String!
    var personSurname: String!
    var personAge: String!
    var personCity: String!
    var personHobby: String!
    var personPhone: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        
        nameLabel.text = personName
        surnameLabel.text = personSurname
        ageLabel.text = personAge
        cityLabel.text = personCity
        hobbyLabel.text = personHobby
        phoneLabel.text = personPhone
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bioVC = segue.destination as? BioViewController {
            bioVC.title = "\(personName ?? "name") \(personSurname ?? "surname") Bio"
        }
    }
}
