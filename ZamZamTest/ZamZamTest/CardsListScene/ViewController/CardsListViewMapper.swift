//
//  CardsListViewMapper.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

enum CardsListViewMapper {
    // MARK: - Typealiases

    typealias State = CardsListState
    typealias Action = CardsListAction
    typealias Props = CardsListView.Props

    // MARK: - Static Methods

    /// Создание свойств View из стейта
    static func map(
        _ state: State,
        action: @escaping (Action) -> Void
    ) -> Props? {
        Props()
    }
}
