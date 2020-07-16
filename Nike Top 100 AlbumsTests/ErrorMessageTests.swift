//
//  ErrorMessageTests.swift
//  Nike Top 100 AlbumsTests
//
//  Created by Taylor Paul on 7/16/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import XCTest
@testable import Nike_Top_100_Albums

class ErrorMessageTests: XCTestCase {
    
    let errorMessage = ErrorMessage("This is a test error")
    
    func test_localizedDescription_withMessage() {
        XCTAssertEqual(errorMessage.localizedDescription, "This is a test error")
    }

}
