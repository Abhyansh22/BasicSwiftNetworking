//
//  MenuItemModel.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import Foundation


struct MenuResponse: Codable{
    let items: [MenuItem]
}

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}


//MARK: Categories response
struct CategoriesResponse: Codable{
    let categories: [String]
}


//MARK: OrderResponse
struct OrderResponse: Codable{
    let prepTime: Int
    enum CodingKeys: String, CodingKey{
        case prepTime = "preparation_Time"
    }
}

struct Order: Codable{
    var menuItems: [MenuItem]
}
