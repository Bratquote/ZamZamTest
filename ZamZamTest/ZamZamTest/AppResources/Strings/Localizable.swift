//
//  Localizable.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import Foundation

class Localizable {
    internal static func localize(_ key: String, _ args: CVarArg...) -> String {
        let format = Bundle.main.localizedString(forKey: key, value: nil, table: "Localizable")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
