//
//  FeedScreenCoordinator.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit
import SafariServices

class FeedScreenCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let model = FeedScreenModel()
        let networkService = NetworkService()
        let rssParserService = RssParser(networkService: networkService)
        let viewModel = FeedScreenViewModel(model: model, rssParserService: rssParserService)
        let vc = FeedScreenViewController.instantiate()
        vc.tabBarItem = UITabBarItem(title: model.navTitle, image: Images.rss, selectedImage: Images.rssFilled)
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSafari(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        navigationController.showDetailViewController(safariViewController, sender: self)
    }
    
    func showErrorAlert(with error: CustomError) {
        let title = Constants.Alert.errorTitle
        var message = String()
        
        switch error {
        case .badUrl(text: let errorMessage):
            message = errorMessage
        case .somethingWrong(text: let errorMessage):
            message = errorMessage
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constants.Alert.okTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController.show(alertController, sender: self)
    }
    
}
