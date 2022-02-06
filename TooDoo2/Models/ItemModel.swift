//
//  ItemModel.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import Foundation

// ItemModel Structure
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString // Generate unique ID
    let title: String // Initialize title
    let isCompleted: Bool // Initialize boolean value to check for completed tasks
}
