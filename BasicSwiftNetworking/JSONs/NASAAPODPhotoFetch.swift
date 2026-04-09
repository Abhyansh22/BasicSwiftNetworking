//
//  NASAAPODPhotoFetch.swift
//  BasicSwiftNetworking
//
//  Created by GU on 09/04/26.
//

import Foundation
import Playgrounds

#Playground {
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
    
    let apiKey = "AtEvYNksePr1k5ez1fIRlEZXqhbNFMxZlRnBaISD"
    
    var nasaURLComponent = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
    
    nasaURLComponent.queryItems = [URLQueryItem(name:"api_key", value:apiKey)]
    
    Task{
        let (data, response) = try await URLSession.shared.data(from: nasaURLComponent.url!)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            
            var jsonRequestContent = try! data

            let jsonDecoder = JSONDecoder()

            let decodedPhoto: PhotoInfo = try jsonDecoder.decode(PhotoInfo.self, from: jsonRequestContent)
            
            print(decodedPhoto)
        }
    }
    
}
