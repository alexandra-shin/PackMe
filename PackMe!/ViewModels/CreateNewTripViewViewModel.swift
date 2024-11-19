//
//  NewTripViewViewModel.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/14/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// View model for single trip (each trip from Home screen)
class CreateNewTripViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var note = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    init () {}
    
    // Save new trip in DB
    func save() {
        guard canSave else {
            return
        }
        // Get current userId
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString   // unique identifier
        let newTrip = Trip(id: newId,
                           title: title,
                           note: note,
                           date: date.timeIntervalSince1970,
                           createdDate: Date().timeIntervalSince1970,
                           isCompleted: false)
        
        // Save model to DB
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("trips")
            .document(newId)
            .setData(newTrip.asDictionary())    // custom extension
    }
    
    // Verify if user provided title of new trip and valid date
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !note.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {       
            return false
        }
        
        return true
    }
}
