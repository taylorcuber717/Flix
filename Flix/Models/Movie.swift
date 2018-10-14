//
//  Movie.swift
//  Flix
//
//  Created by Taylor McLaughlin on 10/10/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class Movie {
    
    var movies: [Movie] = []
    var title: String
    var posterUrl: URL?
    var overview: String?
    var releaseDateLabel: String?
    var id: String?
    var backdropURL: URL?
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? "No title"
        self.overview = dictionary["overview"] as? String ?? "No overview"
        self.releaseDateLabel = dictionary["release_date"] as? String
        let posterPathString = dictionary["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let backdropPathString = dictionary["backdrop_path"] as! String
        self.backdropURL = URL(string: baseURLString + backdropPathString)
        self.posterUrl = URL(string: baseURLString + posterPathString)
        self.id = dictionary["id"] as? String
    }
    
    func fetchMovies() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
                self.movies = []
                for dictionary in movieDictionaries {
                    let movie = Movie(dictionary: dictionary)
                    self.movies.append(movie)
                }
                
            }
        }
        task.resume()
        
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
