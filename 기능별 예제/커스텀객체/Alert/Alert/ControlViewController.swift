//
//  ControlViewController.swift
//  Alert
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    var slider :UISlider?
    var slider_value: Float{
        return self.slider!.value
    }
    var point :UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        point = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        point.textAlignment = .center
        point.text = "0"
        self.view.addSubview(point)
        
        self.slider = UISlider(frame: CGRect(x: 0, y: 50, width: 200, height: 100))
        self.slider?.maximumValue = 200
        self.slider?.minimumValue = 0
        self.slider?.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        self.view.addSubview(slider!)
        
        self.preferredContentSize = CGSize(width: 200, height: 150)

        
    }
    
    @objc func valueChanged(_ sender: Any){
        var sl = sender as! UISlider
        self.point.text = String(sl.value)
    }
    

}
