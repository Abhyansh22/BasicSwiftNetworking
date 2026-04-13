//
//  CategoryListView.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import SwiftUI

struct CategoryListView: View {
    @State private var viewModel = MenuViewModel(categories: [], isLoading: false)
    var body: some View {
        Text("Categories")
        List(viewModel.categories, id: \.self) { category in
            Text(category)
        }
//        .task {
//            try await viewModel.fetchCategories()
//        }
    }
}

#Preview {
    CategoryListView()
}
