//
//  CardsListView.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

import RxCocoa
import RxSwift
import UIKit
import SnapKit
import Then

final class CardsListView: UIView {
    // MARK: - Props
    struct Props: Equatable {
    }

    // MARK: - Internal properties
    let disposeBag = DisposeBag()
    var topBarOffset: CGFloat {
        UIApplication.shared.statusBarFrame.size.height + 44
    }

    // MARK: - Views

    private var backgroundView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = AppResources.colors.white
    }

    private var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.cornerRadius = 20
    }

    private var anonymousView = CardView(type: .anonymous)

    private var confirmedView = CardView(type: .confirmed)

    private var needWriteTextLabel = UILabel()

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        configure()
        setupViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal Methods

extension CardsListView {
    /// Отображение данных модуля
    func render(props: Props) {
    }
}

// MARK: - Private Methods

private extension CardsListView {
    /// Настройка внешнего вида
    func configure() {
        backgroundColor = AppResources.colors.deepBlue
        needWriteTextLabel.text = AppResources.strings.cardsList.needToWriteText
        needWriteTextLabel.textColor = AppResources.colors.darkText
        needWriteTextLabel.font = AppResources.fonts.ptSans.regular.ofSize(14)
    }

    /// Добавление контролов на вью
    func setupViews() {
        addSubview(backgroundView)
        backgroundView.addSubview(scrollView)
        scrollView.addSubviews([anonymousView, confirmedView, needWriteTextLabel])
    }

    /// Установка констрейнтов
    func setupConstraints() {
        backgroundView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(topBarOffset)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        anonymousView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }

        confirmedView.snp.makeConstraints {
            $0.top.equalTo(anonymousView.snp.bottom).offset(24)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }

        needWriteTextLabel.snp.makeConstraints {
            $0.top.equalTo(confirmedView.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(20)
            $0.bottom.greaterThanOrEqualToSuperview().inset(20)
        }
    }
}
