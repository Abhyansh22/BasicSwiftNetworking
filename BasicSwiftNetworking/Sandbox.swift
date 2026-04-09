//
//  Sandbox.swift
//  BasicSwiftNetworking
//
//  Created by GU on 09/04/26.
//

import Foundation
import Playgrounds

#Playground {
    
    // MARK: - Apple.com
    var myURL = URL(string: "https://www.apple.com")!
    Task {
        let (data, response) = try await URLSession.shared.data(from: myURL)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let dataString = String(data: data, encoding: .utf8) {
            print("Data: \(data)")
            print(data as NSData)
            print(dataString)
        }
        else {
            print("Error")
        }
    }
    
    // MARK: - NASA
    
    let apiKey = "AtEvYNksePr1k5ez1fIRlEZXqhbNFMxZlRnBaISD"
    
    let nasaURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)&date=2026-04-01")!
    
    var nasaURLComponent = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
    
    nasaURLComponent.queryItems = [URLQueryItem(name: "api_key", value: apiKey),
    URLQueryItem(name: "date", value: "2026-04-01")]
    Task{
        let (data, response) = try await URLSession.shared.data(from: nasaURLComponent.url!)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let dataString = String(data: data, encoding: .utf8) {
            print(dataString)
        }
    }
}
