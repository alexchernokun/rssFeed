//
//  FeedScreenCoordinator.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class FeedScreenCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showFeedScreen() {
        let model = FeedScreenModel()
        let networkService = NetworkService()
        let rssParserService = RssParser(networkService: networkService)
        let viewModel = FeedScreenViewModel(model: model, rssParserService: rssParserService)
        let vc = FeedScreenViewController.instantiate()
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showWebView() {
        
    }
    
    func showErrorAlert(with error: Error) {
        let title = Constants.Alert.errorTitle
        let message = error.localizedDescription
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constants.Alert.okTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        navigationController.show(alertController, sender: self)
    }
    
}
