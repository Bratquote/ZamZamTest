//
//  CardsListUseCase.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

import RxSwift

/// Стейт машина модуля
protocol CardsListUseCase {
    /// Стейт
    var state: Observable<CardsListState> { get }
    /// Произошло действие от юзера
    func action(_ action: CardsListAction)
}
