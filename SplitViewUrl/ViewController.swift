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

//    func imageLoad () {
//        let loadUrl = "http://s1.picswalls.com/wallpapers/2016/06/10/4k-high-definition-wallpaper_065229159_309.jpg"
//        self.removeSpinner.startAnimating()
//        DispatchQueue.global().async {
//            let url = URL(string: loadUrl)!
//            do {
//                let aData = try Data(contentsOf: url)
//                DispatchQueue.main.async {
//                    self.imageUrl.image = UIImage(data: aData)
//                    self.removeSpinner.stopAnimating()
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//
//    }


    func imageLoad () {
    let loadUrl = "http://s1.picswalls.com/wallpapers/2016/06/10/4k-high-definition-wallpaper_065229159_309.jpg"
        imageUrl.download(from: loadUrl)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLoad()
    
    }


}


