//
//  SavedArticlesScreenViewController.swift
//  RssFeed
//
//  Created by Alex Chernokun on 26.03.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class SavedArticlesScreenViewController: UIViewController, StoryboardInstantiable {
    
    var viewModel: SavedArticlesScreenViewModel!
    weak var coordinator: SavedArticlesCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        title = viewModel.navTitle
        
    }
}
