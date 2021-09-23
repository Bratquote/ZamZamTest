//
//  CardsListViewModel.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 22.09.2021.
//

import RxSwift
import RxSwiftExt

final class CardsListViewModel {
    // MARK: - Public Properties

    weak var sceneDelegate: CardsListSceneDelegate?

    // MARK: - Private Properties

    private let useCase: CardsListUseCase

    // MARK: - Lifecycle
    required init(dependencies: Dependencies) {
        useCase = dependencies.useCase
    }

    // MARK: - Internal methods

    func transform(_ input: Input, outputHandler: (_ output: Output) -> Void) {
        let state = useCase.state

        let props = state
            .map { [useCase] state -> CardsListView.Props? in
                CardsListViewMapper.map(state) { [useCase] in
                    useCase.action($0)
                }
            }
            .distinctUntilChanged()
            .unwrap()

        state.bind { value in
            self.route(value.route)
        }
        .disposed(by: input.bag)

        let output = Output(props: props)
        outputHandler(output)
    }

    // MARK: - Private methods

    private func route(_ target: CardsListRoute) {
        switch target {
        case .none:
            return
        }
        useCase.action(.didRoute(target))
    }
}

// MARK: - Nested types / Enums

extension CardsListViewModel {
    struct Input {
        let bag: DisposeBag
    }

    struct Output {
        let props: Observable<CardsListView.Props>
    }

    struct Dependencies {
        let useCase: CardsListUseCase
    }
}
