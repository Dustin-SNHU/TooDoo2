//
//  ListView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

struct ListView: View {
    
    // Array for task items
    @State var items: [String] = [
        "Task 1",
        "Task 2",
        "Task 3"
    ]
    
    var body: some View {
        List { // Creates a list object
            ForEach(items, id: \.self, content: { item in // Loop to pull in task items specified in the items array
                ListRowView(title: item) // Add item to task list (repeats in loop)
            })
        }
        .listStyle(PlainListStyle()) // Change list style to default android look
        .navigationTitle("TooDoo2") // Navigation title with application name
        .navigationBarItems( // Navigation items at top of application window
            leading: EditButton(), // Edit Button
            trailing: NavigationLink("Add", destination: Text("Destination")) // Add button
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Navigation view handler for the application preview
            ListView()
        }
    }
}
