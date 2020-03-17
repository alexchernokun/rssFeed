//
//  StoryboardInstantiable.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
    static func instantiate() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    
    static func instantiate() -> Self {
        let className = String(describing: Self.self)
        var storyboard = UIStoryboard()
        storyboard = UIStoryboard(name: className, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

}
