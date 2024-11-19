//
//  NewTripView.swift
//  PackMe!
//
//  Created by Aleksandra Guseva on 11/14/24.
//

import SwiftUI

struct CreateNewTripView: View {
    @StateObject var viewModel = CreateNewTripViewViewModel()
    @Binding var newTripPresented: Bool
    @FocusState private var focus: FormFieldFocused?
    
    var body: some View {
        VStack {
            
            Text("New Trip")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .onSubmit {
                        focus = .noteField
                    }
                    .focused($focus, equals: .titleField)
                
                // Notes
                TextField("Notes", text: $viewModel.note)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .focused($focus, equals: .noteField)
                
                // Date
                DatePicker("Date", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                PMButton(title: "Create Trip",
                         background: .brown) {
                    if viewModel.canSave {
                        viewModel.save()
                        newTripPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .onAppear {
                focus = .titleField
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select current or future date."))
            }
        }
    }
    
    // Allows values to be compared against each other
    enum FormFieldFocused: Hashable {
        case titleField, noteField
    }
}

#Preview {
    CreateNewTripView(newTripPresented: Binding(get: {
        return true
    }, set: { _ in
            
    }))
}
