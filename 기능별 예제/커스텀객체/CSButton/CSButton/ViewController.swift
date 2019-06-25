//
//  ViewController.swift
//  CSButton
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var cb1 = CSButton(type: .circle)
        cb1.frame = CGRect(x: 200, y: 400, width: 200, height: 100)
        self.view.addSubview(cb1)
        
        // Do any additional setup after loading the view.
    }


}

