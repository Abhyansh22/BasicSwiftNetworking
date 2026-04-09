//
//  JSONDecodeSandbox.swift
//  BasicSwiftNetworking
//
//  Created by GU on 09/04/26.
//

import Foundation
import Playgrounds

#Playground {
//    struct Movie: Codable {
//        var title: String
//        var director: String
//        var rating: Double
//    }
//    
//    struct ListOfMovies: Codable {
//        var movies: [Movie]
//    }
//    var jsonFilePathURL = Bundle.main.url(forResource: "AMovie", withExtension: "json")
//    
//    var jsonFileContent = try! Data(contentsOf: jsonFilePathURL!)
//    
//    let jsonDecoder = JSONDecoder()
//    
//    let decodedMovie: Movie = try jsonDecoder.decode(Movie.self, from: jsonFileContent)
//    
//    print(decodedMovie)
    
    //MARK: - Decoding file b Movies
    
//    var jsonFilePathURL = Bundle.main.url(forResource: "b Movies", withExtension: "json")
//
//    var jsonFileContent = try! Data(contentsOf: jsonFilePathURL!)
//
//    let jsonDecoder = JSONDecoder()
//    
//    var myMovies = try jsonDecoder.decode([Movie].self, from: jsonFileContent)
    
    //print(myMovies)
    
    
//    var jsonFilePathURL = Bundle.main.url(forResource: "c Movies with wrapper object", withExtension: "json")
//
//    var jsonFileContent = try! Data(contentsOf: jsonFilePathURL!)
//
//    let jsonDecoder = JSONDecoder()
//    
//    //var myMovies = try jsonDecoder.decode([Movie].self, from: jsonFileContent)
//    
//    var myListOfMovie = try jsonDecoder.decode(ListOfMovies.self, from: jsonFileContent)
//    
//    for movie in myListOfMovie.movies{
//        print(movie)
//    }
    
//    struct Movie: Codable {
//        var title: String
//        var details: MovieDetails
//    }
//    
//    struct MovieDetails: Codable{
//        var director: String
//        var rating: Double
//    }
//
//    struct ListOfMovies: Codable {
//        var movies: [Movie]
//    }
//    
//    
//    var jsonFilePathURL = Bundle.main.url(forResource: "d Movies with wrapper object nested", withExtension: "json")
//
//    var jsonFileContent = try! Data(contentsOf: jsonFilePathURL!)
//
//    let jsonDecoder = JSONDecoder()
//
//    //var myMovies = try jsonDecoder.decode([Movie].self, from: jsonFileContent)
//
//    var myListOfMovie = try jsonDecoder.decode(ListOfMovies.self, from: jsonFileContent)
//
//    for movie in myListOfMovie.movies{
//        print(movie.title)
//        print(movie.details)
//    }
    
    
    
    struct Movie: Codable {
        
        enum CodingKeys: String, CodingKey {
            case title
            case director = "movie_director"
            case rating
        }
        
        var title: String
        var director: String
        var rating: Double
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.title = try container.decode(String.self, forKey: .title)
            self.director = try container.decode(String.self, forKey: .director)
            var ratinginSTring = try container.decode(String.self, forKey: .rating)
            self.rating = Double(ratinginSTring) ?? 0.0
        }
        
        func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.title, forKey: .title)
            try container.encode(self.director, forKey: .director)
            try container.encode(self.rating, forKey: .rating)
        }
        
    }

//    struct ListOfMovies: Codable {
//        var movies: [Movie]
//    }
    var jsonFilePathURL = Bundle.main.url(forResource: "f Movies with non matching keys and custom decoding", withExtension: "json")

    var jsonFileContent = try! Data(contentsOf: jsonFilePathURL!)

    let jsonDecoder = JSONDecoder()

    let decodedMovie: Movie = try jsonDecoder.decode(Movie.self, from: jsonFileContent)

    print(decodedMovie)
}
