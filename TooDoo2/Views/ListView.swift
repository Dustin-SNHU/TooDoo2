//
//  ListView.swift
//  TooDoo2
//
//  Created by Dustin Richardson on 2/6/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List { // Creates a list object
            ListRowView(title: "Title") // Extracted structure for to do list row
        }
        .navigationTitle("TooDoo2") // Navigation title with application name
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Navigation view handler for the application preview
            ListView()
        }
    }
}


