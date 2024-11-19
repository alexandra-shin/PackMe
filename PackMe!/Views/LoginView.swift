//
//  LoginView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background_blur")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    // Header
                    HeaderView(title: "Welcome")
                    
                    // Login form
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white)
                                .frame(width: 350, height: 250)
                                .padding()
                                .opacity(0.9)
                                .shadow(radius: 15)

                            ZStack {
                                VStack {
                                    if !viewModel.errorMessage.isEmpty {
                                        Text(viewModel.errorMessage)
                                            .foregroundStyle(Color.red)
                                    }
                                    TextField("Email Address", text: $viewModel.email)
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled(true)
                                    
                                    SecureField("Password", text: $viewModel.password)
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .autocapitalization(.none)
                                        .autocorrectionDisabled(true)
                                    
                                    PMButton(title: "Log In",
                                             background: .brown) {
                                        // Attempt login
                                        viewModel.login()
                                    }
                                    .padding()
                                }
                            }
                        }
                        
                        // Create account
                        VStack {
                            Text("New traveller?")
                                .font(.headline)
                                .opacity(0.5)
                                .foregroundStyle(.white)

                            NavigationLink("Create an Account",
                                           destination: RegisterView())
                            .foregroundStyle(.white)
                            .bold() 
                        }
                    }
                    .padding(.bottom, 150)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
