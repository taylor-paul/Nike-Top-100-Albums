//
//  FeedTests.swift
//  Nike Top 100 AlbumsTests
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import XCTest
@testable import Nike_Top_100_Albums

class FeedTests: XCTestCase {
    
    var feed: Feed?

    override func setUpWithError() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "feed", ofType: "json") else {
            fatalError("Could not find feed.json")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        feed = try JSONDecoder().decode(Feed.self, from: data)
    }

    func test_feedParsing_withCompleteFeed_shouldParse() throws {
        guard let feed = feed else {
            XCTFail("Unexpectedly found nil value for feed")
            return
        }

        XCTAssertEqual(feed.albums.count, 100)
        XCTAssertEqual(feed.albums.first?.genres.count, 3)
    }

}
