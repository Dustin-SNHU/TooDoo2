//
//  ListRowView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

// ListRowView Structure
struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack { // Horizontal stack
            Image(systemName: "checkmark.circle") // Insert check mark next to task item
            Text(title) // Text for task item
            Spacer() // Pushes text to the left of the screen
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "Title")
    }
}
