//
//  PMButton.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/14/24.
//

import SwiftUI

struct PMButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 50)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    PMButton(title: "Value",
             background: .pink) {
        // some action
    }
}
