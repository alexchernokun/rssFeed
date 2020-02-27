//
//  Coordinator.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get }
    init(navigationController: UINavigationController)
    
}
