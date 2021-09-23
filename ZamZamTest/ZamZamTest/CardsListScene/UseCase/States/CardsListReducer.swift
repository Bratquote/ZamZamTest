//
//  CardsListReducer.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

/// Мутатор стейта по эффекту
enum CardsListReducer {
    static func reduce(_ state: CardsListState, _ effect: CardsListEffect) -> CardsListState {
        var state = state
        state.active = .none
        switch effect {
        case .action(let action):
            return CardsListActionReducer.reduce(state, action)
        }
    }
}

/// Мутатор стейта по действию из UI
enum CardsListActionReducer {
    static func reduce(_ state: CardsListState, _ action: CardsListAction) -> CardsListState {
        var state = state
        switch action {
        case .didRoute:
            state.route = .none
        }
        return state
    }
}
