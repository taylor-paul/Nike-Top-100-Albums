//
//  GenreTests.swift
//  Nike Top 100 AlbumsTests
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import XCTest
@testable import Nike_Top_100_Albums

class GenreTests: XCTestCase {
    
    var genre: Genre?

    override func setUpWithError() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "genre", ofType: "json") else {
            fatalError("Could not find genre.json")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        genre = try JSONDecoder().decode(Genre.self, from: data)
    }

    func testAlbumParsing() throws {
        guard let genre = genre else {
            XCTFail("Unexpectedly found nil value for albums")
            return
        }

        XCTAssertEqual(genre.name, "Pop")
    }

}
