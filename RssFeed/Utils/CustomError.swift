//
//  CustomError.swift
//  RssFeed
//
//  Created by Alex Chernokun on 27.02.2020.
//  Copyright © 2020 Alex Chernokun. All rights reserved.
//

import Foundation

enum CustomError {
    case somethingWrong(text: String)
    case badUrl(text: String)
}
