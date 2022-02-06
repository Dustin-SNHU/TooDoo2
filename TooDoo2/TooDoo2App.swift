//
//  TooDoo2App.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

@main
struct TooDoo2App: App {
    
    // Variable for the listViewModel
    @StateObject var listViewModel: ListViewModel = ListViewModel() // Note: Obeservable object
    
    // Main body for application
    var body: some Scene {
        WindowGroup {
            NavigationView { // View controlling navigation between screens
                ListView()
            }
            .environmentObject(listViewModel) // Assign environment Object
        }
    }
}
