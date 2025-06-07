//
//  User.swift
//  loginApp
//
//  Created by Leonid on 04.06.2025.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "111",
            person: Person(
                name: "Leonid",
                surname: "Perlin",
                age: "25",
                city: "Tel-Aviv",
                hobby: "Сycling",
                phone: "+972 55-257-30-16"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: String
    let city: String
    let hobby: String
    let phone: String
}
