//
//  ListRowView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

// ListRowView Structure
struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack { // Horizontal stack
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle") // Insert check mark next to task item if it has been completed
                .foregroundColor(item.isCompleted ? .green : .gray) // Set checkmark object to green if completed or gray if not completed
            Text(item.title) // Text for task item
            Spacer() // Pushes text to the left of the screen
        }
        .padding(.vertical, 8) // Padding between task items
    }
}

// Preview Provider
struct ListRowView_Previews: PreviewProvider {
    
    // Temporary items used for preview testing
    static var item1 = ItemModel(title: "Task 1", isCompleted: false)
    static var item2 = ItemModel(title: "Task 2", isCompleted: true)
    
    // View for both temporary items
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits) // Removes the need for both iOS devices to show up in the preview provider
    }
}
