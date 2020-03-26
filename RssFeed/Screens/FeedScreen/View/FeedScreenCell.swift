//
//  FeedScreenCell.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

class FeedScreenCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(with item: RssFeedItem) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        dateLabel.text = item.date
    }
    
    func nullifyLabelsText() {
        titleLabel.text = nil
        descriptionLabel.text = nil
        dateLabel.text = nil
    }
}
