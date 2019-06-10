//
//  ReadViewController.swift
//  CustomUITest
//
//  Created by Yongwan on 01/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {
    var subject: String!
    var isOn: Bool!
    var term: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        var title = UILabel()
        title.frame = CGRect(x: 100, y: 100, width: 300, height: 40)
        title.text = "이메일 : \(subject!)"
        self.view.addSubview(title)
        
        var updated = UILabel()
        updated.frame = CGRect(x: 100, y: 150, width: 300, height: 40)
        var gang = isOn ? "갱신됨" : "갱신안됨"
        updated.text = "업데이트 여부 : \(gang)"
        self.view.addSubview(updated)
        
        var upterm = UILabel()
        upterm.frame = CGRect(x: 100, y: 200, width: 300, height: 40)
        upterm.text = "업데이트 주기 : \(term!) 마다"
        self.view.addSubview(upterm)
        
        
        // Do any additional setup after loading the view.
    }
    

}
