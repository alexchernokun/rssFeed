//
//  MainCoordinator.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    unowned var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.modalPresentationStyle = .fullScreen
    }
    
    func start() {
        let feedScreenCoordinator = FeedScreenCoordinator(navigationController: navigationController)
        feedScreenCoordinator.showFeedScreen()
    }
    
    func navigateBack() {
        navigationController.popViewController(animated: true)
    }
}

extension UIViewController {
    override open func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 13.0, *) {
            // Light interface style.
            overrideUserInterfaceStyle = .light
        }
    }
}
