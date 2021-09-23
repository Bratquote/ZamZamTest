//
//  ClearNavigationController.swift
//  ZamZamTest
//
//  Created by Timur Karimov on 23.09.2021.
//

import UIKit

class ClearNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear
        self.navigationBar.titleTextAttributes = [
            .font: AppResources.fonts.ptSans.bold.ofSize(20),
            .foregroundColor: AppResources.colors.white
        ]
        self.navigationBar.tintColor = AppResources.colors.white
        UINavigationBar.appearance().titleTextAttributes = [
            .font: AppResources.fonts.ptSans.bold.ofSize(20),
            .foregroundColor: AppResources.colors.white
        ]
    }
}
