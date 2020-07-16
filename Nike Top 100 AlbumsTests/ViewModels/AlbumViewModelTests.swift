//
//  AlbumViewModelTests.swift
//  Nike Top 100 AlbumsTests
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import XCTest
@testable import Nike_Top_100_Albums

class AlbumViewModelTests: XCTestCase {

    // MARK: - Name Tests

    func test_name_shouldFormat() {
        let album = Album(name: "Legends Never Die",
                          artistName: "",
                          releaseDate: "",
                          genres: [],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)
        
        XCTAssertEqual(albumViewModel.name, "Legends Never Die")
    }
    
    // MARK: - Arist Name Tests

    func test_artistName_shouldFormat() {
        let album = Album(name: "",
                          artistName: "Juice WRLD",
                          releaseDate: "",
                          genres: [],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertEqual(albumViewModel.artistName, "Juice WRLD")
    }
    
    // MARK: - Artwork URL Tests

    func test_artworkUrl_isNotNil() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "",
                          genres: [],
                          url: "",
                          artworkUrl: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/1c/76/a6/1c76a62d-992f-52d7-f86c-8b2e292b6518/20UMGIM58295.rgb.jpg/200x200bb.png",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertNotNil(albumViewModel.artworkUrl)
    }
    
    // MARK: - Genre Tests
    
    func test_genres_withNoGenres_shouldBeEmpty() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "",
                          genres: [],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertEqual(albumViewModel.genres, "")
    }
    
    func test_genres_withOneGenres_shouldFormat() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "",
                          genres: [Genre(name: "Hip-Hop/Rap")],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertEqual(albumViewModel.genres, "Hip-Hop/Rap")
    }

    func test_genres_withTwoGenres_shouldFormat() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "",
                          genres: [Genre(name: "Hip-Hop/Rap"), Genre(name: "Music")],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertEqual(albumViewModel.genres, "Hip-Hop/Rap • Music")
    }
    
    func test_genres_withThreeGenres_shouldFormat() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "",
                          genres: [Genre(name: "Hip-Hop/Rap"), Genre(name: "Pop"), Genre(name: "Music")],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertEqual(albumViewModel.genres, "Hip-Hop/Rap • Pop • Music")
    }
    
    // MARK: - Copyright Tests

    func test_copyright_shouldFormat() {
        let album = Album(name: "Legends Never Die",
                          artistName: "",
                          releaseDate: "",
                          genres: [],
                          url: "",
                          artworkUrl: "",
                          copyright: "℗ 2020 Grade A Productions, LLC")
        let albumViewModel = AlbumViewModel(album: album)
        
        XCTAssertEqual(albumViewModel.copyright, "℗ 2020 Grade A Productions, LLC")
    }

    // MARK: - Release Date Tests
    
    func test_releaseDateFormat_withExpectedFormat_shouldFormat() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "2020-07-10",
                          genres: [],
                          url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)
        
        XCTAssertEqual(albumViewModel.releaseDate, "Jul 9, 2020")
    }
    
    func test_releaseDateFormat_withMissingDay_shouldFormat() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "1980-06",
                          genres: [], url: "",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)
        
        XCTAssertEqual(albumViewModel.releaseDate, "1980-06")
    }
    
    // MARK: - Album URL Tests

    func test_albumUrl_isNotNil() {
        let album = Album(name: "",
                          artistName: "",
                          releaseDate: "",
                          genres: [],
                          url: "https://music.apple.com/us/album/legends-never-die/1522943749?app=itunes",
                          artworkUrl: "",
                          copyright: "")
        let albumViewModel = AlbumViewModel(album: album)

        XCTAssertNotNil(albumViewModel.albumUrl)
    }

}
