//
//  AlbumApiTests.swift
//  Nike Top 100 AlbumsTests
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import XCTest
@testable import Nike_Top_100_Albums

class AlbumApiTests: XCTestCase {

    func testFetchAlbums() {
        let expectation = XCTestExpectation(description: "Fetch iTunes albums")

        AlbumApi.fetchAlbumsJSON { result in
            switch result {
            case .success(let albums):
                XCTAssertNotNil(albums)
                XCTAssertEqual(albums.count, 100)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        
        wait(for: [expectation], timeout: 20.0)
    }

}
