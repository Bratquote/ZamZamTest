//
//  CardType.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import UIKit

enum CardType {
    case anonymous
    case confirmed
}

extension CardType {
    var title: String {
        switch self {
        case .anonymous:
            return AppResources.strings.cardsList.anonymous

        case .confirmed:
            return AppResources.strings.cardsList.confirmed
        }
    }

    var backgoundColor: UIColor {
        switch self {
        case .anonymous:
            return AppResources.colors.blue

        case .confirmed:
            return AppResources.colors.lightBlue
        }
    }

    var textColor: UIColor {
        switch self {
        case .anonymous:
            return AppResources.colors.white

        case .confirmed:
            return AppResources.colors.darkText
        }
    }

    var leftImage: UIImage {
        switch self {
        case .anonymous:
            return AppResources.images.masterCard.image

        case .confirmed:
            return AppResources.images.card.image.withRenderingMode(.alwaysTemplate)
        }
    }

    var leftText: String {
        switch self {
        case .anonymous:
            return AppResources.strings.cardsList.virtualCard

        case .confirmed:
            return AppResources.strings.cardsList.authenticationPassed
        }
    }

    var maxBalanceSize: String {
        switch self {
        case .anonymous:
            return "15 000 ₽"

        case .confirmed:
            return "60 000 ₽"
        }
    }

    var maxWithdrawSize: String {
        switch self {
        case .anonymous:
            return "40 000 ₽"

        case .confirmed:
            return "200 000 ₽"
        }
    }
}
