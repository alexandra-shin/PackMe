//
//  User.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/14/24.
//

import Foundation

// This struct will be converted into dictionary, which will be inserted in DB (with custom extension)
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
