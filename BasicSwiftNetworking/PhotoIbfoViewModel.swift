//
//  PhotoIbfoViewModel.swift
//  BasicSwiftNetworking
//
//  Created by GU on 10/04/26.
//

import Foundation

@Observable
class PhotoIbfoViewModel{
    var photoInfo: PhotoInfo?
    var errorMessage: String?
    static let previewModel = PhotoIbfoViewModel()
    var isLoading = false
    let apiKey = "AtEvYNksePr1k5ez1fIRlEZXqhbNFMxZlRnBaISD"
    
//    init(photoInfo: PhotoInfo? = nil, errorMessage: String? = nil) {
//        self.photoInfo = photoInfo
//        self.errorMessage = errorMessage
//    }
    
    init() {
        Task{
            isLoading = true
            defer{
                isLoading = false
            }
            do{
                self.photoInfo = try await fetchPhotoInfo()
            }catch{
                print("Error in intializing view model")
            }
        }
    }
    
    
    func fetchPhotoInfo() async throws-> PhotoInfo {
        var nasaURLComponent = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        
        nasaURLComponent.queryItems = [URLQueryItem(name:"api_key", value:apiKey),
        URLQueryItem(name: "date", value: "2026-04-01")]
        
        let (data, response) = try await URLSession.shared.data(from: nasaURLComponent.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            errorMessage = "Could not load data"
            throw URLError(.badServerResponse)
        }
        
        var myPhotoInfo = try JSONDecoder().decode(PhotoInfo.self, from: data)
        return myPhotoInfo
    }
    
}


