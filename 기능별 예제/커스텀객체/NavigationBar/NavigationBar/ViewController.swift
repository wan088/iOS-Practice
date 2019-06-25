//
//  ViewController.swift
//  NavigationBar
//
//  Created by Yongwan on 05/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.initTitle()
        self.initTitle4()
    }
    func initTitle(){
        var tit = UILabel()
        tit.text = "58개의 숙소 \n 1박2일일거임 아마"
        tit.textAlignment = .center
        tit.textColor = UIColor.white
        tit.numberOfLines = 2
        tit.font = UIFont.systemFont(ofSize: 14)
        
        self.navigationItem.titleView = tit
        self.navigationController?.navigationBar.barTintColor = .black
        
    }
    func initTitle2(){
        var cv = UIView()
        cv.frame = CGRect(x: 0, y: 0, width: 200, height: 360)
        
        var tit1 = UILabel()
        tit1.text = "53개의 숙소"
        tit1.frame = CGRect(x: 0, y: 0, width: 200, height: 18)
        tit1.textAlignment = .center
        tit1.font = UIFont.systemFont(ofSize: 15)

        
        var tit2 = UILabel()
        tit2.text = "2박3일일거임 아마"
        tit2.frame = CGRect(x: 0, y: 18, width: 200, height: 12)
        tit2.textAlignment = .center
        tit2.font = UIFont.systemFont(ofSize: 12)
      
        
        cv.addSubview(tit1)
        cv.addSubview(tit2)
        
        self.navigationItem.titleView = cv

    }
    func initTitle3(){
        var iv = UIImageView()
        iv.image = UIImage(named: "swift_logo")
        
        self.navigationItem.titleView = iv
    }
    
    func initTitle4(){
        var tf = UITextField()
        
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderColor = UIColor.red.cgColor
        tf.layer.borderWidth = 0.3
        
        //left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow-back"), style: .plain, target: self, action: nil)
        
        //right
        var contain = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 35))
        var iv1 = UILabel(frame: CGRect(x: 10, y: 8, width: 20, height: 20))
        iv1.text = "3"
        iv1.layer.cornerRadius = 3
        iv1.layer.borderColor = UIColor.black.cgColor
        iv1.layer.borderWidth = 2
        iv1.textAlignment = .center
        iv1.font = UIFont.boldSystemFont(ofSize: 10)
        
    
        var iv2 = UIButton(frame: CGRect(x: 40 , y: 8 , width: 20, height: 20))
        iv2.setImage(UIImage(named: "more"), for: .normal)
        contain.addSubview(iv1)
        contain.addSubview(iv2)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: contain)
        
        
       
        self.navigationItem.titleView = tf
    }

}

