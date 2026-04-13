//
//  PhotoInfoModel.swift
//  BasicSwiftNetworking
//
//  Created by GU on 10/04/26.
//

import Foundation
struct PhotoInfo: Codable {
    
    enum CodingKeys: String, CodingKey{
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    var title: String
    var description: String
    var url: String
    var copyright: String?
}
