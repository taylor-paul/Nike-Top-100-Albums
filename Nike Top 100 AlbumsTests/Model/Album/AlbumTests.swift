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

        XCTAssertEqual(album.genres.count, 3)
    }

}
