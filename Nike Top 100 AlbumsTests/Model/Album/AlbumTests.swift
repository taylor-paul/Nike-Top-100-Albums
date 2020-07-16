//
//  AlbumTests.swift
//  Nike Top 100 AlbumsTests
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import XCTest
@testable import Nike_Top_100_Albums

class AlbumTests: XCTestCase {
    
    var album: Album?

    override func setUpWithError() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "album", ofType: "json") else {
            fatalError("Could not find album.json")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        album = try JSONDecoder().decode(Album.self, from: data)
    }

    func testAlbumParsing() throws {
        guard let album = album else {
            XCTFail("Unexpectedly found nil value for albums")
            return
        }

        XCTAssertEqual(album.artistName, "BTS")
        XCTAssertEqual(album.releaseDate, "2020-07-15")
        XCTAssertEqual(album.copyright, "A Virgin Music release; ℗ 2020 UNIVERSAL MUSIC LLC")
        XCTAssertEqual(album.artworkUrl,
                       "https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/f0/84/a4/f084a4f6-a9ec-eeb5-ce14-73ba08f8b653/20UMGIM44782.rgb.jpg/200x200bb.png")
        XCTAssertEqual(album.genres.count, 3)
        XCTAssertEqual(album.url,
                       "https://music.apple.com/us/album/map-of-the-soul-7-the-journey/1517969553?app=itunes")
    }

}
