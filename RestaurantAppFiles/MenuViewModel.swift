//
//  MenuViewModel.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import Foundation


@Observable
class MenuViewModel{
    var categories: [String]
    var isLoading: Bool = false
    var errorMessage: String?
    
    init(categories: [String], isLoading: Bool, errorMessage: String? = nil) {
        self.categories = categories
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
//
//    func fetchCategories() async throws {
        
//    }
}
