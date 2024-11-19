//
//  TripView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/15/24.
//

import SwiftUI

struct TripView: View {
    @StateObject var viewModel = TripViewViewModel()
    
    let trip: Trip
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(trip.title)
                    .font(.body)
                    .bold()
                
                Text(trip.note)
                    .font(.footnote)
                    .foregroundStyle(Color(.systemGray2))
    
                Text("\(Date(timeIntervalSince1970: trip.date), format: .dateTime)")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            
            // Check-uncheck the trip (circle icon)
            Button {
                viewModel.toggleIsDone(trip: trip)
            } label: {
                // If the trip is Completed show circle with checkmark, else - empty circle
                Image(systemName: trip.isCompleted ?
                      "checkmark.square.fill" : "square")
                .foregroundStyle(Color.brown)
            }
        }
    }
}

#Preview {
    TripView(trip: .init(id: "123",
                         title: "San Francisco",
                         note: "Pack: umbrella",
                         date: Date().timeIntervalSince1970,
                         createdDate: Date().timeIntervalSince1970,
                         isCompleted: true))
}
