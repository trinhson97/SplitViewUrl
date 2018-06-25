//
//  CacheImage.swift
//  SplitViewUrl
//
//  Created by Son on 2018/06/23.
//  Copyright © 2018 son. All rights reserved.
//

import Foundation

class CacheImage {
    static var images : NSCache<NSString, AnyObject> = {
        var result = NSCache<NSString, AnyObject>()
        result.countLimit = 10
        result.totalCostLimit = 10 * 1024 * 1024
        return result
    } ()
}
