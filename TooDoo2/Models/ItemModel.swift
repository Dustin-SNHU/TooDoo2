//
//  ItemModel.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import Foundation

// ItemModel Structure
struct ItemModel: Identifiable {
    let id: String // Generate ID String
    let title: String // Initialize title
    let isCompleted: Bool // Initialize boolean value to check for completed tasks
    
    // Initialize ItemModel Structure
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) { // Automatically create a unique ID for storing data
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // Update Completed ItemModel
    func updateCompleted() -> ItemModel { // Note: Call function within the ItemModel
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
