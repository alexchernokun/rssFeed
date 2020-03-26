//
//  Constants.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Alert {
        static let badUrlTitle = "Incorrect URL"
        static let errorTitle = "Oops, something went wrong"
        static let okTitle = "Ok"
    }
    
    struct Network {
        static let rssUrl = "https://www.wired.com/feed/rss"
    }
    
    struct Cell {
        static let feedCellName = "FeedScreenCell"
        static let feedCellIdentifier = "feedCell"
    }
    
    struct DateFormat {
        static let getFormat = "E, d MMM yyyy HH:mm:ss Z"
        static let returnFormat = "MMM d, yyyy HH:mm"
    }
}
