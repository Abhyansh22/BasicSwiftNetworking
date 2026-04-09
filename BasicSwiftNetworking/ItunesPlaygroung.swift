//
//  ItunesPlaygroung.swift
//  BasicSwiftNetworking
//
//  Created by GU on 09/04/26.
//

import Foundation
import Playgrounds

#Playground {
    struct WrapperRecord: Codable {
        var results: [WrapperSongInfo]
    }
    
    struct WrapperSongInfo: Codable {
        var artistName: String
        var collectionName: String?
        var trackName: String?
        var trackPrice: Double?
    }
    
    var url = "https://itunes.apple.com/search"
    var itunesUrlComponents = URLComponents(string: url)!
    itunesUrlComponents.queryItems = [URLQueryItem(name:"term", value: "karan+aujla"), URLQueryItem(name: "media", value: "music")]
    
    
    Task{
        let (data, response) = try await URLSession.shared.data(from: itunesUrlComponents.url!)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200{
            print(data)
            var jsonFileContent = try! data

            let jsonDecoder = JSONDecoder()

            let decodedWrapperRecord: WrapperRecord = try jsonDecoder.decode(WrapperRecord.self, from: jsonFileContent)
            
            for oneRecord in decodedWrapperRecord.results{
                print(oneRecord)
            }
        }
    }
}
