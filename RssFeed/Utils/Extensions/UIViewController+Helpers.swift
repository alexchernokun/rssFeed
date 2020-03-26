//
//  UIViewController+Helpers.swift
//  RssFeed
//
//  Created by Alex Chernokun on 26.03.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

extension UIViewController {
    override open func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 13.0, *) {
            // Light interface style.
            overrideUserInterfaceStyle = .light
        }
    }
}
