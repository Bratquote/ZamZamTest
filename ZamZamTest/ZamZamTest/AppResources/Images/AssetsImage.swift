//
//  AssetsImage.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import UIKit

enum AssetsImage: String {
    case masterCard
    case card
    case mobile
}

extension AssetsImage {
    var image: UIImage {
        return UIImage.appImage(self)
    }
}
