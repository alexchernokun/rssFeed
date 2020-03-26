//
//  SavedArticlesScreenViewModel.swift
//  RssFeed
//
//  Created by Alex Chernokun on 26.03.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import Foundation

class SavedArticlesScreenViewModel {
    
    var model: SavedArticlesScreenModel
    
    init(model: SavedArticlesScreenModel) {
        self.model = model
    }
    
    var navTitle: String {
        return model.navTitle
    }
}
