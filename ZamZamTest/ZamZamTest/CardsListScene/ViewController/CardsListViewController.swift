//
//  CardsListViewController.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

import RxCocoa
import RxSwift
import UIKit

final class CardsListViewController: UIViewController {
    // MARK: - Internal properties

    let viewModel: CardsListViewModel

    // MARK: - Private properties

    private let mainView: CardsListView
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle

    required init(dependencies: Dependencies) {
        viewModel = dependencies.viewModel
        mainView = CardsListView()
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Viewcycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutput()
    }

    // MARK: - Bindings methods

    func setupOutput() {
        viewModel.transform(.init(bag: disposeBag), outputHandler: setupInput)
    }

    func setupInput(input: CardsListViewModel.Output) {
        input.props
            .observe(on: MainScheduler.instance)
            .subscribeNext(weak: mainView, CardsListView.render)
            .disposed(by: disposeBag)
    }
}

// MARK: - Nested types / Enums

extension CardsListViewController {
    struct Dependencies {
        let viewModel: CardsListViewModel
    }
}
