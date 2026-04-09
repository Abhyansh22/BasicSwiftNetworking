//
//  ItunesPlaygroung.swift
//  BasicSwiftNetworking
//
//  Created by GU on 09/04/26.
//

import Foundation
import Playgrounds

#Playground {
    var url = "https://itunes.apple.com/search"
    var itunesUrlComponents = URLComponents(string: url)!
    itunesUrlComponents.queryItems = [URLQueryItem(name:"term", value: "karan+aujla"), URLQueryItem(name: "media", value: "music")]
    
    
    Task{
        let (data, response) = try await URLSession.shared.data(from: itunesUrlComponents.url!)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let dataSting = String(data: data, encoding: .utf8){
            print(dataSting)
        }
    }
}
