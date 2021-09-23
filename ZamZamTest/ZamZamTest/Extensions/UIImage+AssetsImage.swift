//
//  UIImage+AssetsImage.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import UIKit.UIImage

extension UIImage {
    static func appImage(_ name: AssetsImage) -> UIImage {
        return UIImage(named: name.rawValue) ?? .init()
    }
}
