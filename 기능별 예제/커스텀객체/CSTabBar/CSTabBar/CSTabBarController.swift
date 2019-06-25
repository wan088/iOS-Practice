//
//  CSTabBarController.swift
//  CSTabBar
//
//  Created by Yongwan on 09/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class CSTabBarController: UITabBarController {
    
    var CSView: UIView!
    
    var Button01: UIButton!
    var Button02: UIButton!
    var Button03: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
        
        var x: CGFloat = 0
        var y: CGFloat = self.view.frame.height-50
        var height: CGFloat = 50
        var width = self.view.frame.width
        
        CSView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        CSView.backgroundColor = .black
        self.view.addSubview(CSView)
        
        Button01 = UIButton(type: .system)
        Button01.frame = CGRect(x: x, y: y, width: width/3, height: height)
        
        Button02 = UIButton(type: .system)
        Button02.frame = CGRect(x: x+width/3, y: y, width: width/3, height: height)
        
        Button03 = UIButton(type: .system)
        Button03.frame = CGRect(x: x+2*(width/3), y: y, width: width/3, height: height)
        
        addButton(button: Button01, title: "첫번째 버튼", tag: 0)
        addButton(button: Button02, title: "두번째 버튼", tag: 1)
        addButton(button: Button03, title: "세번째 버튼", tag: 2)
        
        onButtonTouched(Button01)
        
        
    }
    
    func addButton(button: UIButton, title: String, tag: Int){
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.orange, for: .selected)
        
        button.tag = tag
        
        button.addTarget(self, action: #selector(onButtonTouched(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        
    }
    
    

    @objc func onButtonTouched(_ sender: UIButton){
        Button01.isSelected = false
        Button02.isSelected = false
        Button03.isSelected = false
        
        sender.isSelected = true
        self.selectedIndex = sender.tag
    }
}
