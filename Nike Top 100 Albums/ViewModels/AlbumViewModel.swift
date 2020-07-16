//
//  AlbumViewModel.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import Foundation

/// Transforms the *Album* model into values for presentation.
struct AlbumViewModel {
    
    private let album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    /// The date formatter for formatting a date from iTunes.
    private static let iTunesDateFormatter: DateFormatter = {
        let iTunesDateFormatter = DateFormatter()
        iTunesDateFormatter.dateFormat = "yyyy-MM-dd"
        iTunesDateFormatter.calendar = Calendar(identifier: .iso8601)
        iTunesDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return iTunesDateFormatter
    }()
    
    /// The date formatter for formatting a date for presentation in a view.
    private static let presentationFormatter: DateFormatter = {
        let presentationFormatter = DateFormatter()
        presentationFormatter.dateStyle = .medium
        presentationFormatter.timeStyle = .none

        return presentationFormatter
    }()

}

extension AlbumViewModel {
    
    /// The string to be presented for the album's name.
    var name: String {
        return album.name
    }
    
    /// The string to be presented for the artist's name.
    var artistName: String {
        return album.artistName
    }
    
    /// The url of the image to be prented for the album's artwork.
    var artworkUrl: URL? {
        return URL(string: album.artworkUrl) ?? nil
    }
    
    /// The string to be presented for the album's genre(s).
    var genres: String {
        let genreNames: [String] = album.genres.compactMap( {$0.name} )
        return genreNames.joined(separator: " • ")
    }
    
    /// The string to be presented for the album's copyright).
    var copyright: String {
        return album.copyright
    }
    
    var releaseDate: String {
        // Convert the string from iTunes into a date.
        guard let date = AlbumViewModel.iTunesDateFormatter.date(from: album.releaseDate) else {
            // An album could be missing the day, causing the date formatting to fail.
            // Fallback to the original string.
            return album.releaseDate
        }

        return AlbumViewModel.presentationFormatter.string(from: date)
    }
    
    /// The url of the album for navigation to iTunes.
    var albumUrl: URL? {
        return URL(string: album.url) ?? nil
    }
    
}
