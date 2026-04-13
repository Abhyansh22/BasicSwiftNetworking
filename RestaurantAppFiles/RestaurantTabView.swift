//
//  RestaurantTabView.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import SwiftUI

struct RestaurantTabView: View {
    var body: some View{
        TabView {
            Tab("Menu", systemImage: "list.bullet") {
                NavigationStack{
                    CategoryListView()
                }
            }
            
            Tab("Orders", systemImage: "bag") {
                NavigationStack{
                    OrderView()
                }
            }
        }
    }
}

#Preview {
    RestaurantTabView()
}
