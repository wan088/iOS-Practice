//
//  ImageViewController.swift
//  Alert
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var image = UIImage(named: "rating5")
        var iv = UIImageView(image: image)
        
        iv.frame.size = image!.size
        self.view.addSubview(iv)
        
        self.preferredContentSize = image!.size
        
        
    }


}
