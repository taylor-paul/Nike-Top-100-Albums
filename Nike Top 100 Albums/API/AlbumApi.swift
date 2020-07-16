//
//  AlbumApi.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import Foundation

/// An api for fetching albums from the iTunes RSS feed.
class AlbumApi {
    
    /// Fetches the top 100 albums from iTunes.
    ///
    /// - Parameters:
    ///     - completion: The closure to execute on completion.
    static func fetchAlbumsJSON(completion: @escaping (Result<[Album], Error>) ->()) {
        let albumUrlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json"
        guard let albumUrl = URL(string: albumUrlString) else {
            return
        }
        URLSession.shared.dataTask(with: albumUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let feed = try decoder.decode(Feed.self, from: data)
                    let albums = feed.albums
                    completion(.success(albums))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(ErrorMessage("Missing data when fetching albums.")))
            }
    
        }.resume()
    }
    
}
