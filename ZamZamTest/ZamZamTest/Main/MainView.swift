//
//  MainView.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 22.09.2021.
//

import UIKit

class MainView: UIView {

    var showButton = UIButton().then {
        $0.setTitle(AppResources.strings.main.openCardsList, for: .normal)
    }

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = AppResources.colors.deepBlue
        self.addSubview(showButton)
        setupConstraints()
    }

    func setupConstraints() {
        showButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
    }
}
