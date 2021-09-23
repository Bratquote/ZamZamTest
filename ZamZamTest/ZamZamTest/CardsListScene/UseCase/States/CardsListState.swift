//
//  CardsListState.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//


/// Стейт
struct CardsListState {
    // MARK: - Public properties

    /// Куда совершать переход
    var route: CardsListRoute = .none

    /// Активность всего стейта
    var active: ActiveState = .none

    // MARK: - Queries

    // MARK: - Lifecycle

    init() {
    }
}
