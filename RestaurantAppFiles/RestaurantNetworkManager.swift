//
//  RestaurantNetworkManager.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import Foundation


class RestaurantNetworkManager {
    static let shared = RestaurantNetworkManager()
    let baseURL = URL(string: "http://localhost:8080")!
    enum NetworkError: Error, LocalizedError {
        case categoriesNotFound
        case menuItemsNotFound
        case orderRequestFailed
    }
    
    private init() { }
    
    func fetchCategories() async throws -> [String]{
        let categoriesURL = baseURL.appending(component: "categories")
        let (data, response) = try await URLSession.shared.data(from: categoriesURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200  else{
            throw NetworkError.categoriesNotFound
        }
        let availableCategories = try JSONDecoder().decode(CategoriesResponse.self, from: data)
        
        return availableCategories.categories
    }
    
    func fetchMenuItems(forCategory categoryName: String) async throws ->
    [MenuItem] {
        let baseMenuURL = baseURL.appending(component: "menu")
        var components = URLComponents(url: baseMenuURL,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value:categoryName)]
        let menuURL = components.url!
        let (data, response) = try await URLSession.shared.data(from: menuURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw NetworkError.menuItemsNotFound
        }
        let availableMenuItems = try JSONDecoder().decode(MenuResponse.self, from: data)
        
        return availableMenuItems.items
        
    }

}
