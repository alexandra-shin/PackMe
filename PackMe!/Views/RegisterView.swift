//
//  RegisterView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        ZStack {
            Image("register_blur2")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HeaderView(title: "Register")
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white)
                            .frame(width: 350, height: 300)
                            .padding()
                            .opacity(0.9)
                            .shadow(radius: 15)
                        
                        ZStack {
                            VStack {
                                if !viewModel.errorMessage.isEmpty {
                                    Text(viewModel.errorMessage)
                                        .foregroundStyle(Color.red)
                                }
                                TextField("Full name", text: $viewModel.name)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .autocapitalization(.none)
                                    .autocorrectionDisabled(true)
                                
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
                                
                                PMButton(title: "Create Account",
                                         background: .blue) {
                                    // Attempt registration
                                    viewModel.register()
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 150)
        }
    }
}

#Preview {
    RegisterView()
}
