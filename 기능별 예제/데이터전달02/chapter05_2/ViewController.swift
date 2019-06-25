//
//  ViewController.swift
//  chapter05_2
//
//  Created by Yongwan on 07/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Email: UILabel!
    @IBOutlet var isUpdate: UILabel!
    @IBOutlet var updateTime: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        
        
        if let tmp = ud.string(forKey: "e"){
            self.Email.text = tmp
        }
        isUpdate.text = ud.bool(forKey: "u") ? "자동" : "수동"
        
        let num = ud.integer(forKey: "i")        
        self.updateTime.text = "\(num) 분"
    }
    
}
