//
//  File.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import Foundation

class FeedScreenViewModel {
    
    var model: FeedScreenModel
    var rssParserService: RssParser
    var rssFeedItems: [RssFeedItem]?
    
    var didReceiveRssFeed: (() -> Void)?
    var failedToReceiveRssFeed: ((Error) -> Void)?
    
    var navTitle: String {
        return model.navTitle
    }
    
    func getRssFeed() {
        rssParserService.getXML { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let rssFeedItems):
                self.rssFeedItems = rssFeedItems
                self.didReceiveRssFeed?()
            case .failure(let error):
                self.failedToReceiveRssFeed?(error)
            }
        }
    }
    
    init(model: FeedScreenModel, rssParserService: RssParser) {
        self.model = model
        self.rssParserService = rssParserService
    }
    
}
