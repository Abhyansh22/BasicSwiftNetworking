//
//  MenuItemListView.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import SwiftUI

struct MenuItemListView: View {
    let category: String
    var body: some View {
        Text("Items in category: \(category)")
    }
}

#Preview {
    MenuItemListView(category: "Some Category")
}
