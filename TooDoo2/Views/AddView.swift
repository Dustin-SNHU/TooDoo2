//
//  AddView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

// View for adding a new task item
struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode // Monitor where application view is
    @EnvironmentObject var listViewModel: ListViewModel // Retrieve Environment Object
    @State var textFieldText: String = "" // Variable to hold new task name information
    
    var body: some View {
        ScrollView { // Enables page scrolling on this page
            VStack { // Vertical stack
                TextField("New Item...", text: $textFieldText) // Text field to enter a new task into
                    .padding(.horizontal) // Horizontal padding
                    .frame(height: 55) // Create framing for field
                    .frame(maxWidth: .infinity) // Set frame width
                    .background(Color(red: 0.922, green: 0.922, blue: 0.922)) // Set light gray background color
                    .cornerRadius(10) // Create corner radius
                
                // Save button
                Button(action:saveButtonPressed, label: {
                    
                    // Save button
                    Text("Save".uppercased())
                        .foregroundColor(Color.white) // Set text to white
                        .frame(height: 55) // Set frame height
                        .frame(maxWidth: .infinity) // Set frame width
                        .background(Color.accentColor) // Make button blue (accdentColor)
                        .cornerRadius(10) // Match corner radius
                })
            }
            .padding(14) // Padding for entire view
        }
        .navigationTitle("Add New Task...") // Title of page
    }
    
    // Save button function
    func saveButtonPressed() {
        if textBlank() { // Will only run if the field is not blank
            listViewModel.addItem(title: textFieldText) // Add item from textfield
            presentationMode.wrappedValue.dismiss() // Return back to list using presentationMode
        }
    }
    
    // Function to check to see if text is entered in task field
    func textBlank() -> Bool {
        if textFieldText.count < 1 { // If text field is blank, return false, else reuturn true
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel()) // Allow preview of ListViewModel
    }
}
