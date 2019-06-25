//
//  FrontViewController.swift
//  SideBar
//
//  Created by Yongwan on 09/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet var sideBar: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let rvc = self.revealViewController(){
            sideBar.target = rvc
            sideBar.action = #selector(rvc.revealToggle(_:))
            self.view.addGestureRecognizer(rvc.panGestureRecognizer())
        }
    }

}
