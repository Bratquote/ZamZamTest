//
//  CardView.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import UIKit
import SwifterSwift

class CardView: UIView {

    let type: CardType

    var titleLabel = UILabel()
    var leftItemImageView = UIImageView()
    var leftItemLabel = UILabel()

    var connectedPhoneImageView = UIImageView(
        image: AppResources.images.mobile.image.withRenderingMode(.alwaysTemplate)
    )
    var connectedPhoneLabel = UILabel()

    var separatorLineView = UIView()

    var maxBalanceSizeLabel = UILabel()
    var maxBalanceTitleLabel = UILabel()

    var maxWithdrawSizeLabel = UILabel()
    var maxWithdrawTitleLabel = UILabel()


    init(type: CardType) {
        self.type = type
        super.init(frame: .zero)
        configure()
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        self.cornerRadius = 10
        backgroundColor = type.backgoundColor
        titleLabel.textColor = type.textColor
        titleLabel.text = type.title
        titleLabel.font = AppResources.fonts.ptSans.bold.ofSize(32)

        connectedPhoneImageView.tintColor = type.textColor
        connectedPhoneLabel.text = AppResources.strings.cardsList.phoneLinked
        connectedPhoneLabel.textColor = type.textColor
        connectedPhoneLabel.numberOfLines = 2
        connectedPhoneLabel.font = AppResources.fonts.ptSans.regular.ofSize(12)

        leftItemImageView.image = type.leftImage
        leftItemImageView.tintColor = type.textColor
        leftItemLabel.text = type.leftText
        leftItemLabel.textColor = type.textColor
        leftItemLabel.numberOfLines = 2
        leftItemLabel.font = AppResources.fonts.ptSans.regular.ofSize(12)
        leftItemLabel.minimumScaleFactor = 0.5

        maxWithdrawSizeLabel.text = type.maxWithdrawSize
        maxWithdrawSizeLabel.font = AppResources.fonts.ptSans.bold.ofSize(20)
        maxWithdrawSizeLabel.textColor = type.textColor

        maxBalanceSizeLabel.text = type.maxBalanceSize
        maxBalanceSizeLabel.font = AppResources.fonts.ptSans.bold.ofSize(20)
        maxBalanceSizeLabel.textColor = type.textColor

        maxWithdrawTitleLabel.text = AppResources.strings.cardsList.maxWithdrawSize
        maxWithdrawTitleLabel.font = AppResources.fonts.ptSans.regular.ofSize(14)
        maxWithdrawTitleLabel.textColor = type.textColor
        maxWithdrawTitleLabel.numberOfLines = 3
        
        maxBalanceTitleLabel.text = AppResources.strings.cardsList.maxAccountBalance
        maxBalanceTitleLabel.font = AppResources.fonts.ptSans.regular.ofSize(14)
        maxBalanceTitleLabel.textColor = type.textColor
        maxBalanceTitleLabel.numberOfLines = 3

        separatorLineView.backgroundColor = type.textColor.withAlphaComponent(0.3)


    }

    func setupViews() {
        self.addSubviews([
            titleLabel,
            leftItemImageView,
            leftItemLabel,
            connectedPhoneImageView,
            connectedPhoneLabel,
            separatorLineView,
            maxBalanceSizeLabel,
            maxBalanceTitleLabel,
            maxWithdrawSizeLabel,
            maxWithdrawTitleLabel,
        ])
    }



    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
        }

        leftItemImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.left.equalToSuperview().offset(16)
        }

        leftItemLabel.snp.makeConstraints {
            $0.centerY.equalTo(leftItemImageView)
            $0.left.equalTo(leftItemImageView.snp.right).offset(8)
            $0.right.lessThanOrEqualTo(self.snp.centerX)
            $0.height.equalTo(60)
        }

        connectedPhoneImageView.snp.makeConstraints {
            $0.centerY.equalTo(leftItemImageView.snp.centerY)
            $0.left.equalTo(self.snp.centerX).offset(16)
        }

        connectedPhoneLabel.snp.makeConstraints {
            $0.centerY.equalTo(connectedPhoneImageView)
            $0.left.equalTo(connectedPhoneImageView.snp.right).offset(8)
            $0.height.equalTo(60)
        }

        separatorLineView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(leftItemImageView.snp.bottom).offset(20)
            $0.height.equalTo(0.5)
        }

        maxBalanceSizeLabel.snp.makeConstraints {
            $0.top.equalTo(separatorLineView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
            $0.right.lessThanOrEqualTo(self.snp.centerX).inset(8)
        }

        maxBalanceTitleLabel.snp.makeConstraints {
            $0.top.equalTo(maxBalanceSizeLabel.snp.bottom).offset(4)
            $0.left.equalTo(maxBalanceSizeLabel)
            $0.bottom.equalToSuperview().inset(20)
            $0.right.equalTo(self.snp.centerX).inset(8)
        }

        maxWithdrawSizeLabel.snp.makeConstraints {
            $0.top.equalTo(separatorLineView.snp.bottom).offset(20)
            $0.left.equalTo(self.snp.centerX).offset(8)
            $0.right.lessThanOrEqualToSuperview().inset(8)
        }

        maxWithdrawTitleLabel.snp.makeConstraints {
            $0.top.equalTo(maxWithdrawSizeLabel.snp.bottom).offset(4)
            $0.left.equalTo(maxWithdrawSizeLabel)
            $0.bottom.equalToSuperview().inset(20)
            $0.right.lessThanOrEqualToSuperview().inset(8)
        }
    }
}
