//
//  HomeScreenViewViewModel.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/14/24.
//

import FirebaseFirestore
import Foundation

/// View model for list of trips
/// Home tab
class HomeScreenViewViewModel: ObservableObject {
    @Published var showingNewTripView = false
    
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    /// Delete trip
    /// - Parameter id: Trip id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("trips")
            .document(id)
            .delete()        
    }
}
