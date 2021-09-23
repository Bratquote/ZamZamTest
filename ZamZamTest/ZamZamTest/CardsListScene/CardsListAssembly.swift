//
//  CardsListAssembly.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 22.09.2021.
//

import Foundation

class CardsListAssembly {
    func create() -> CardsListViewController {
        let useCase = CardsListUseCaseImpl(inital: .init())
        let viewModel = CardsListViewModel(dependencies: .init(useCase: useCase))
        let viewController = CardsListViewController(dependencies: .init(viewModel: viewModel))
        return viewController
    }
}
