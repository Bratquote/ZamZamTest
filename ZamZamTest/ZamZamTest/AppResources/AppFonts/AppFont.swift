//
//  AppFont.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import UIKit

public struct AppFont {
    // MARK: - Properties

    let name: String

    // MARK: - Functions

    public func ofSize(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            assertionFailure("Unsuccessful attempt to create font. Font name - \"\(name)\"")
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}

extension AppFont: ExpressibleByStringLiteral {
    // MARK: - Constructor

    public init(stringLiteral value: String) {
        self.name = value
    }
}

