//
//  Feed.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import Foundation

/// The model for the RSS feed from iTunes.
struct Feed: Codable {

    /// The array of Albums.
    let albums: [Album]

    /// The keys for decoding a *Feed*.
    enum FeedKeys: CodingKey {
        case feed
    }
    
    /// The keys for decoding the results array.
    enum ResultsKeys: CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let feed = try decoder.container(keyedBy: FeedKeys.self)
        let results = try feed.nestedContainer(keyedBy: ResultsKeys.self, forKey: .feed)
        self.albums = try results.decode([Album].self, forKey: .results)
    }

}
