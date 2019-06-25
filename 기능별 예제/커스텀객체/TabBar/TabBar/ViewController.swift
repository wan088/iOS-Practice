//
//  ViewController.swift
//  TabBar
//
//  Created by Yongwan on 04/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var subject: UILabel!
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var tb = self.tabBarController?.tabBar
        //tb?.isHidden = tb?.isHidden == true ? false : true
        
        print(tb?.frame.origin.y)
        UIView.animate(withDuration: 1){
            
            tb?.frame.origin.y = tb?.frame.origin.y == 618 ? 718 : 618
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subject = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        subject.text = "첫번째 화면"
        subject.font = UIFont.systemFont(ofSize: 14)
        subject.textColor = UIColor.red
        
        subject.sizeToFit()
        subject.center.x = self.view.frame.width/2
        
        
        self.view.addSubview(subject)
        
        
    }


}

