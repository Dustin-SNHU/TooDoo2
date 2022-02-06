//
//  ListView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

struct ListView: View {
    
    // Array for task items; Contains data from the ItemModel Swift file
    @State var items: [ItemModel] = [
        ItemModel(title: "Task 1", isCompleted: false),
        ItemModel(title: "Task 2", isCompleted: true),
        ItemModel(title: "Task 3", isCompleted: false),
    ]
    
    var body: some View {
        List { // Creates a list object
            ForEach(items, content: { item in // Loop to pull in task items specified in the items array
                ListRowView(item: item) // Pass each ListRowView item as the loop loops
            })
        }
        .listStyle(PlainListStyle()) // Change list style to default android look
        .navigationTitle("TooDoo2") // Navigation title with application name
        .navigationBarItems( // Navigation items at top of application window
            leading: EditButton(), // Edit Button
            trailing: NavigationLink("Add", destination: AddView()) // Add button which moves to the AddView view
        )
    }
}

// Preview Provider
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Navigation view handler for the application preview
            ListView()
        }
    }
}
