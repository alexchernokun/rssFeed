//
//  SavedRssArticlesCoordinator.swift
//  RssFeed
//
//  Created by Alex Chernokun on 25.03.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class SavedArticlesCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let model = SavedArticlesScreenModel()
        let viewModel = SavedArticlesScreenViewModel(model: model)
        let vc = SavedArticlesScreenViewController.instantiate()
        vc.tabBarItem = UITabBarItem(title: model.navTitle, image: Images.saved, selectedImage: Images.savedFilled)
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
