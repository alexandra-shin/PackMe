//
//  HomeScreenView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/14/24.
//

import FirebaseFirestore
import SwiftUI

struct HomeScreenView: View {
    @StateObject var viewModel: HomeScreenViewViewModel
    @FirestoreQuery var trips: [Trip]   // query listens for Trips
        
    init(userId: String) {
        self._trips = FirestoreQuery(collectionPath: "users/\(userId)/trips")
        self._viewModel = StateObject(wrappedValue: HomeScreenViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Loop over trips and show them on Home screen
                List(trips) { trip in
                    TripView(trip: trip)
                        .swipeActions {
                            // Delete trip on swiping left
                            Button("Delete") {
                                viewModel.delete(id: trip.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Your trips")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewTripView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewTripView) {
                CreateNewTripView(newTripPresented:
                    $viewModel.showingNewTripView)
            }
        }
    }
}

#Preview {
    HomeScreenView(userId: "DfZtLe6ppIW6nyUn3Z1ZOQeBHTN2")  // my test user id from DB
}
