//
//  ProfileView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.brown)
            .frame(width: 140, height: 140)
        
        // User info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(.all, 10)
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(.all, 10)
            HStack {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(.all, 10)
        }
        
        // Sign out
        PMButton(title: "Log out", background: .brown) {
            viewModel.logOut()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
