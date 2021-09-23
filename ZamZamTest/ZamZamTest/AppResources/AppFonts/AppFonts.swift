//
//  AppFonts.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import Foundation
import CoreText

/// Example: Нужно изменить под проект
public class AppFonts: NSObject {
    // MARK: - Properties

    public let ptSans = PTSansFonts()

    // MARK: - Constructor

    override internal init() {
        super.init()
        [
            "PTSans-Bold",
            "PTSans-BoldItalic",
            "PTSans-Italic",
            "PTSans-Regular",
        ]
        .forEach { appFont in
            AppFonts.loadFont(withName: appFont)
        }
    }

    // MARK: - Methods

    private static func loadFont(withName fontName: String) {
        let bundle = Bundle.main
        let fontExtension = "ttf"
        guard
            let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension)
        else { return }
        let cfURL = fontURL as CFURL

        CTFontManagerRegisterFontsForURL(cfURL, .process, nil)
    }
}
