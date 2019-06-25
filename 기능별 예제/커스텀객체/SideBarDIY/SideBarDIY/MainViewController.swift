//
//  MainViewController.swift
//  SideBarDIY
//
//  Created by Yongwan on 09/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var sv: RearViewController!
    var view2: UIView!
    var nvc: UINavigationController?
    var side: RearViewController?
    
    var isSidebarShowing: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        

        // Do any additional setup after loading the view.
    }
    @objc func doit(_sender : UIBarButtonItem){
        self.getSideView()
    }
    //first page init
    func setUpView(){
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "front") as? UINavigationController{
            self.nvc = vc
            var view = (vc.view)!
            self.addChild(vc)
            self.view.addSubview(view)
            vc.didMove(toParent: self)
            
            let frontVC = vc.viewControllers[0] as? ViewController
            frontVC?.delegate = self
        }
        
    }
    
    //read sidebar view
    func getSideView(){
        if sv == nil{
            if let sv = self.storyboard?.instantiateViewController(withIdentifier: "rear") as? RearViewController{
                self.side = sv
                view2 = (sv.view)!
                self.addChild(sv)
                self.view.addSubview(view2)
                sv.didMove(toParent: self)
                self.view.bringSubviewToFront((self.nvc?.view)!)
            }
        }
        
    }
    
    //set shadow effect to contents view
    func setShadowEffect(shadow: Bool, offset: CGFloat){
        
    }
    
    //open
    func openSideBar(_ complete: (()->Void)?){
        self.getSideView()
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions(arrayLiteral: .curveEaseInOut, .beginFromCurrentState), animations: {
            self.nvc?.view.frame = CGRect(x: 200, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: {
            if $0 == true{
                self.isSidebarShowing = true
                complete?()
            }
        })
    }
    //close
    func closeSideBar(_ complete: (()->Void)?){
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions(arrayLiteral: .curveEaseInOut, .beginFromCurrentState), animations: {
            self.nvc?.view.frame.origin = CGPoint(x: 0, y: 0)
        }, completion: {
            if $0 == true{
                self.isSidebarShowing = false
                self.side?.view.removeFromSuperview()
                self.sv = nil
                complete?()
            }
        })
    }
    
}
