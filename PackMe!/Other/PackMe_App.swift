//
//  PackMe_App.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import FirebaseCore
import SwiftUI

@main
struct PackMe_App: App {
    init () {
        FirebaseApp.configure()        
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

