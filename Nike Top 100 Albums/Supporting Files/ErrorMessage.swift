//
//  ErrorMessage.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/16/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import Foundation

/// Custom error type with a message.
struct ErrorMessage: Error {

    private let message: String

    /// The description of the error.
    var localizedDescription: String {
        return message
    }

    init(_ message: String) {
        self.message = message
    }

}
