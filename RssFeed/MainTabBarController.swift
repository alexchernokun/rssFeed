//
//  MainCoordinator.swift
//  RssFeed
//
//  Created by Alex Chernokun on 26.03.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var feedScreenNavController: UINavigationController?
    var savedArticlesNavController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCoordinators()
        
        guard let feedScreenNavController = feedScreenNavController, let savedArticlesNavController = savedArticlesNavController else { fatalError() }
        viewControllers = [feedScreenNavController, savedArticlesNavController]
        
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    private func setupCoordinators() {
        feedScreenNavController = UINavigationController()
        savedArticlesNavController = UINavigationController()
        let feedScreenCoordinator = FeedScreenCoordinator(navigationController: feedScreenNavController!)
        let savedArticlesCoordinator = SavedArticlesCoordinator(navigationController: savedArticlesNavController!)
        feedScreenCoordinator.start()
        savedArticlesCoordinator.start()
    }
    
    private func setupNavigationBar() {
        feedScreenNavController?.navigationBar.prefersLargeTitles = true
        savedArticlesNavController?.navigationBar.prefersLargeTitles = true
    }
}
