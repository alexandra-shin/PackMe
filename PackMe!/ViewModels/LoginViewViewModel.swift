//
//  LoginViewViewModel.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
        
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error as? NSError {
                switch AuthErrorCode(rawValue: error.code) {
                case .userDisabled:
                    self.errorMessage = "This user has been disabled."
                default :
                    self.errorMessage = "User with such credentials does not exist."
                }
            }
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please provide valid email."
            return false
        }
        return true
    }
}
