//
//  Identifiable.swift
//  Nike Top 100 Albums
//
//  Created by Taylor Paul on 7/15/20.
//  Copyright © 2020 Taylor Paul. All rights reserved.
//

import Foundation

/// A type with a string identifier.
protocol Identifiable {

    /// The string identifier.
    static var identifier: String { get set }

}
