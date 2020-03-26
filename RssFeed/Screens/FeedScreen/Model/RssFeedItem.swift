//
//  RssItem.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import Foundation

struct RssFeedItem {
    var title: String
    var description: String
    var link: String
    var rawDate: String
    
    var url: URL? {
        return URL(string: link)
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat.getFormat
        guard let date = dateFormatter.date(from: rawDate) else { return "" }
        dateFormatter.dateFormat = Constants.DateFormat.returnFormat
        return dateFormatter.string(from: date)
    }
}
