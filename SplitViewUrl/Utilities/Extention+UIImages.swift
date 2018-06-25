//
//  Extention+UIImages.swift
//  SplitViewUrl
//
//  Created by Son on 2018/06/21.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

extension UIImageView {
    func download(from urlString: String) {
            let url = URL(string: urlString)!
            do {
                
                if let cache = CacheImage.images.object(forKey: url.absoluteString as NSString) as? UIImage {
                    image = cache
                    
                } else {
                    let aData = try Data(contentsOf: url)
                    self.image = UIImage(data: aData)
                    CacheImage.images.setObject(image!, forKey: url.absoluteString as NSString, cost: aData.count)
                    
                }
                
            } catch {
                print(error.localizedDescription)
            
        }
    }
}


