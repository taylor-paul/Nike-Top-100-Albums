//
//  Album.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import Foundation

/// The model for an *Album*.
struct Album: Codable {

    let name: String
    let artistName: String
    let releaseDate: String
    let genres: [Genre]
    let url: String
    let artworkUrl: String
    let copyright: String

    enum CodingKeys: String, CodingKey {
        case name, artistName, releaseDate, genres, url, copyright
        case artworkUrl = "artworkUrl100"
    }
}
