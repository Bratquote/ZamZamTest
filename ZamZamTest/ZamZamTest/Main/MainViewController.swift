//
//  MainViewController.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 21.09.2021.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {

    var mainView = MainView()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = AppResources.strings.main.limits
        setupAction()
    }

    func setupAction() {
        mainView.showButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.openCardsList()
            })
            .disposed(by: disposeBag)
    }

    func openCardsList() {
        let cardsViewController = CardsListAssembly().create()
        navigationController?.show(cardsViewController, sender: nil)
    }

}
