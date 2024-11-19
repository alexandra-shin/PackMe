//
//  ContentView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // Show signed in state
            accountView
        } else {
            // Show log in screen
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            HomeScreenView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainView()
}
