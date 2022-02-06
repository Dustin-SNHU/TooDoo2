//
//  ListView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel // Retrieve items from inside of listViewModel
    
    var body: some View {
        List { // Creates a list object
            ForEach(listViewModel.items) { item in // Loop to pull in task items specified in the items array
                ListRowView(item: item) // Pass each ListRowView item as the loop loops
                    .onTapGesture { // Add tap gesture
                        withAnimation(.linear) { // Animate tapping a task item
                            listViewModel.updateItem(item: item) // Invoke updateItem function
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem) // Call deleteItem function when onDelete is invoked
            .onMove(perform: listViewModel.moveItem) // Call moveItem function when onMove is invoked
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
        .environmentObject(ListViewModel()) // Retrieve data from the ListViewModel
    }
}
