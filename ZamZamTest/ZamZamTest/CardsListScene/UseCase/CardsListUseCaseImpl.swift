//
//  CardsListUseCaseImpl.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

import RxFeedback
import RxRelay
import RxSwift

/// Midleware для
final class CardsListUseCaseImpl: CardsListUseCase {
    // MARK: - Typealiases

    typealias Effect = CardsListEffect
    typealias State = CardsListState
    typealias Action = CardsListAction
    typealias Reducer = CardsListReducer

    // MARK: - Inital

    struct Inital {
    }

    // MARK: - Public properties

    var state: Observable<State>

    // MARK: - Private properties

    private let feedBackPort: PublishRelay<Effect>

    // MARK: - Lifecycle

    init(inital: Inital) {
        // Настраиваем порт эвентов
        let feedBackPort = PublishRelay<Effect>()
        let feedbackLoopPort: FeedbackLoop = { [feedBackPort] state in
            feedBackPort
                .asObservable()
                .observe(on: state.scheduler)
        }
        self.state = .empty()
        self.feedBackPort = feedBackPort
        self.state = Observable.system(
            initialState: State(),
            reduce: Reducer.reduce,
            scheduler: MainScheduler.instance,
            feedback: [
                feedbackLoopPort
            ]
        )
        .share(replay: 1, scope: .forever)
    }

    // MARK: - Public methods

    func action(_ action: Action) {
        feedBackPort.accept(.action(action))
    }
}

// MARK: - Nested types
extension CardsListUseCaseImpl {
    /// FeedbackLoop
    typealias FeedbackLoop = (ObservableSchedulerContext<State>) -> Observable<Effect>
}
