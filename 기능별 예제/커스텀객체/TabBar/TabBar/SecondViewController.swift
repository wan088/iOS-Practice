//
//  SecondViewController.swift
//  TabBar
//
//  Created by Yongwan on 04/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var subject: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        subject = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        subject.text = "두번째 화면"
        subject.font = UIFont.systemFont(ofSize: 14)
        subject.textColor = UIColor.red
        
        subject.sizeToFit()
        subject.center.x = self.view.frame.width/2
        
        self.view.addSubview(subject)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
