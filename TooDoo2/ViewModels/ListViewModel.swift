//
//  ListViewModel.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import Foundation

// Create class
class ListViewModel: ObservableObject {
    
    // Create array and call any time a change is made to the task list
    @Published var items: [ItemModel] = [] {
        didSet { // Call function anytime data is affected
            saveItems() // Use saveItems function
        }
    }
    
    let itemsKey: String = "items_list" // Create unique key for the task list
    
    // Initialize variables
    init() {
        getItems() // Use getItems function
    }
    
    // getItems function
    func getItems() {
        
        // Get tasks that are currently stored in UserDefaults
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey), // Get data from UserDefaults
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) // Decode data from JSON if it exists
        else {
            return
        }
        
        self.items = savedItems // Update Array with savedItems
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
    
    // Update item function
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) { // Find first index where an item resides; will match a unique key associated wit that item
            items[index] = item.updateCompleted() // Change the status of the item that is selected
        }
    }
    
    // Save item function
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) { // Encode item from array into JSON format for saving to UserDefaults
            UserDefaults.standard.set(encodedData, forKey: itemsKey) // Save encoded items in array to UserDefaults using unique forKey
        }
    }
}
