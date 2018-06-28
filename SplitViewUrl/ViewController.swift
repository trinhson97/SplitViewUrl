//
//  ViewController.swift
//  SplitViewUrl
//
//  Created by Son on 2018/06/20.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var removeSpinner: UIActivityIndicatorView!
    @IBOutlet weak var imageUrl: UIImageView!
    
    var disPatchWorkItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeSpinner.startAnimating()
        fetchImage(from: "http://s1.picswalls.com/wallpapers/2016/06/10/4k-high-definition-wallpaper_065229159_309.jpg") { (image) in
            self.imageUrl.image = image
            self.removeSpinner.stopAnimating()
            self.removeSpinner.isHidden = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        disPatchWorkItem?.cancel()
    }
    func fetchImage(from urlString: String, completedHandler: @escaping (UIImage?) -> Void ) {
        guard let url = URL(string: urlString) else { return  }
        var image: UIImage?
        disPatchWorkItem = DispatchWorkItem(block: {
            do {
                if let cache = CacheImage.images.object(forKey: url.absoluteString as NSString) as? UIImage {
                    image = cache
                } else {
                    let aData = try Data(contentsOf: url)
                    image = UIImage(data: aData)
                    CacheImage.images.setObject(image!, forKey: url.absoluteString as NSString, cost: aData.count)
                }
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        })
        DispatchQueue.global().async {
//            perform in GCD
            self.disPatchWorkItem?.perform()
            DispatchQueue.main.async {
                completedHandler(image)
            }
        }
    }
  
}


