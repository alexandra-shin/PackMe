//
//  BackgroundView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/13/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
   
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 40))
            Spacer()
       }
       .foregroundStyle(.white)
       .bold()
       .padding(.top, 50)                    
    }
}

#Preview {
    HeaderView(title: "Title")
}
