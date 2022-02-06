//
//  ListViewModel.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import Foundation

// Create class
class ListViewModel: ObservableObject {
    
    // Create blank array for new tasks
    @Published var items: [ItemModel] = []
    
    // Initialize variables
    init() {
        getItems() // Use getItems function
    }
    
    // getItems function
    func getItems() {
        
        // Array contents
        let newItems = [
            ItemModel(title: "Task 1", isCompleted: false),
            ItemModel(title: "Task 2", isCompleted: true),
            ItemModel(title: "Task 3", isCompleted: false),
        ]
        items.append(contentsOf: newItems) // Add items to array
    }
    
    // Delete item function
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet) // Index where item is deleted from
    }
    
    // Move item function
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to) // Move actions for Offests
    }
    
    // Add item function
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false) // A new item will be added with title and isCompleted as being false
        items.append(newItem) // Add new item
    }
    
}
