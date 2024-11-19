//
//  TripViewViewModel.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/15/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// Viewmodel for signle to do list item view (each rom in items list)
class TripViewViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone(trip: Trip) {
        var tripCopy = trip  // we are not using just 'trip' because it is constant, that's why we need to create a copy of 'trip'
        tripCopy.setCompleted(!trip.isCompleted)
        
        // We need to update record in our DB if trip is completed (checked) or not
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("trips")
            .document(tripCopy.id)
            .setData(tripCopy.asDictionary())
    }
}
