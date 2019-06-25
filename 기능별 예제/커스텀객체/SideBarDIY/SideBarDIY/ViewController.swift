//
//  ViewController.swift
//  SideBarDIY
//
//  Created by Yongwan on 09/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var delegate: MainViewController?
    
    @IBOutlet var side: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.side.target = self
        self.side.action = #selector(moveSide)
        
        var ges = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        ges.edges = .left
        self.view.addGestureRecognizer(ges)
        
        var ges2 = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        ges2.direction = .left
        self.view.addGestureRecognizer(ges2)
    }
    
    @objc func moveSide(_ sender: Any){
        if sender is UIScreenEdgePanGestureRecognizer && self.delegate?.isSidebarShowing == true{
            return
        }else if sender is UISwipeGestureRecognizer && self.delegate?.isSidebarShowing == false{
            return
        }
        if self.delegate?.isSidebarShowing == true{
            self.delegate?.closeSideBar(nil)
        }else{
            self.delegate?.openSideBar(nil)
        }
        
    }
    
    
}

