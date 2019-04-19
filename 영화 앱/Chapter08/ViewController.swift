//
//  ViewController.swift
//  Chapter08
//
//  Created by Yongwan on 09/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악이 어쩌구", "2008-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31),
        ("샤잠", "유치한 DC 히어로영화", "2019-04-05", 6.95)
    ]
    
    lazy var list: [MovieVO] = {
        var tmpList = [MovieVO]()
        for (title, description, opendate, rating) in dataset {
            tmpList.append(MovieVO(title, description, opendate, rating))
        }
        return tmpList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension 
