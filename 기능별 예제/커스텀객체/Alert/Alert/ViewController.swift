//
//  ViewController.swift
//  Alert
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //map button
        var btn1 = UIButton(type: .system)
        btn1.frame = CGRect(x: 0, y: 100, width: 200, height: 100)
        btn1.center.x = self.view.frame.width/2
        btn1.setTitle("기본 알림창", for: .normal)
        btn1.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        //image button
        var btn2 = UIButton(type: .system)
        btn2.frame = CGRect(x: 0, y: 200, width: 200, height: 100)
        btn2.center.x = self.view.frame.size.width/2
        btn2.setTitle("이미지 알림창", for: .normal)
        btn2.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        self.view.addSubview(btn2)
        
        //slider button
        var btn3 = UIButton(type: .system)
        btn3.frame = CGRect(x: 0, y: 300, width: 200, height: 100)
        btn3.center.x = self.view.frame.size.width/2
        btn3.setTitle("슬라이더 알림창", for: .normal)
        btn3.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        self.view.addSubview(btn3)
        
        //table button
        var btn4 = UIButton(type: .infoDark)
        btn4.frame = CGRect(x: 0, y: 400, width: 200, height: 100)
        btn4.center.x = self.view.frame.width/2
        btn4.setTitle("테이블 알림창", for: .normal)
        btn4.addTarget(self, action: #selector(tableAlert), for: .touchUpInside)
        self.view.addSubview(btn4)
        
    }
    @objc func tableAlert(_ sender: Any){
        var alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        var ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        var tVC = TableViewController()
        tVC.delegate = self
        
        alert.setValue(tVC, forKey: "contentViewController")
        
        self.present(alert, animated: true)
        
    }
    
    @objc func sliderAlert(_ sender: Any){
        
        var iVC = ControlViewController()
        
        var alert = UIAlertController(title: "몇점?", message: nil, preferredStyle: .alert)
        var ok = UIAlertAction(title: "OK", style: .default){(_) in
                print(iVC.slider_value)
        }
        alert.addAction(ok)
        
        alert.setValue(iVC, forKey: "contentViewController")
        
        self.present(alert, animated: true)
        
    }
    
    @objc func imageAlert(_ sender: Any){
        var alert = UIAlertController(title: "이번 글의 평점은 다음과 같습니다", message: nil, preferredStyle: .alert)
        var ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        
        var iVC = ImageViewController()
        alert.setValue(iVC, forKey: "contentViewController")
        
        self.present(alert, animated: true)
        
    }
    
    @objc func defaultAlert(_ sender: Any){
        var alert = UIAlertController(title: "이곳이 맞습니까?", message: nil, preferredStyle: .alert)
        var ok = UIAlertAction(title: "OK", style: .default)
        var cancel = UIAlertAction(title: "cancel", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
 
        var v = MapKitViewController()
        
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: true)
    }
    
    func cellPrint(row r: Int){
        print("\(r+1)번째 행이군요")
    }

}

