//
//  FeedViewController.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class FeedScreenViewController: UIViewController, StoryboardInstantiable {
    
    var viewModel: FeedScreenViewModel!
    var coordinator: FeedScreenCoordinator!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        setupViewModelCallbacks()
        
        viewModel.getRssFeed()
    }
    
    private func setupUI() {
        self.title = viewModel.navTitle
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: Constants.Cell.feedCellName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.Cell.feedCellIdentifier)
    }
    
    private func setupViewModelCallbacks() {
        viewModel.didReceiveRssFeed = { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.failedToReceiveRssFeed = { [unowned self] error in
            let customError = CustomError.somethingWrong(text: error.localizedDescription)
            self.coordinator.showErrorAlert(with: customError)
        }
    }
    
}

// MARK: - TableView Conformance
extension FeedScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rssFeedItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.feedCellIdentifier, for: indexPath) as! FeedScreenCell
        guard let rssFeedItems = viewModel.rssFeedItems else { return cell }
        let rssFeedItem = rssFeedItems[indexPath.row]
        cell.setupCell(with: rssFeedItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let rssFeedItems = viewModel.rssFeedItems else { return }
        let rssFeedItem = rssFeedItems[indexPath.row]
        guard let url = rssFeedItem.url else {
            let customError = CustomError.badUrl(text: Constants.Alert.badUrlTitle)
            coordinator.showErrorAlert(with: customError)
            return
        }
        coordinator.showSafari(with: url)

    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.feedCellIdentifier, for: indexPath) as! FeedScreenCell
        cell.nullifyLabelsText()
    }
}
