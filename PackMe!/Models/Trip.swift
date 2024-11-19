//
//  Trip.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/15/24.
//

import Foundation

struct Trip: Codable, Identifiable {
    let id: String
    let title: String
    let note: String
    let date: TimeInterval
    let createdDate: TimeInterval
    var isCompleted: Bool
    
    mutating func setCompleted(_ state: Bool) {
        isCompleted = state
    }
}
