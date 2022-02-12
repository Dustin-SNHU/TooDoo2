//
//  ItemModel.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import Foundation

// ItemModel Structure
struct ItemModel: Identifiable, Codable { // Make ItemModel structure identifiable and codable
    let id: String // Generate ID String
    let title: String // Initialize title
    let isCompleted: Bool // Initialize boolean value to check for completed tasks
    let description: String // Initilize description
    let date: Date // Initialize date
    
    // Initialize ItemModel Structure
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, description: String, date: Date) { // Automatically create a unique ID for storing data
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.description = description
        self.date = date

    }
    
    // Update Completed ItemModel
    func updateCompleted() -> ItemModel { // Note: Call function within the ItemModel
        return ItemModel(id: id, title: title, isCompleted: !isCompleted, description: description, date: date)
    }
}
