//
//  ViewController.swift
//  CustomUITest
//
//  Created by Yongwan on 01/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var email_text: UILabel!
    var autoR_text: UILabel!
    var termR_text: UILabel!
    
    var email_field: UITextField!
    var autoR_switch: UISwitch!
    var autoR_result: UILabel!
    var termR_stepper: UIStepper!
    var termR_result: UILabel!

    //Label을 등록해주는 함수
    func addLabel(obj: inout UILabel!, rect: CGRect, text: String){
        obj = UILabel(frame: rect)
        obj.text = text
        obj.font = UIFont(name: UIFont.fontNames(forFamilyName: "Georgia")[0], size: 14)
        self.view.addSubview(obj)
        
    }
    
    @objc func PorM(_ sender: UIStepper){
        termR_result.text = "\(Int(sender.value))분마다"
    }
    @objc func swit(_ sender: UISwitch){
        if(sender.isOn){
            autoR_result.text = "갱신됨"
        }else{
            autoR_result.text = "갱신안됨"
        }
    }
    @objc func submitBtn(_ sender: Any){
        var rvc = ReadViewController()
        rvc.isOn = autoR_switch.isOn
        rvc.subject = email_field.text
        rvc.term = termR_stepper.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "설정"
        
        var item = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submitBtn(_:)))
        self.navigationItem.rightBarButtonItem = item
        
        
        //label들 다 등록!
        self.addLabel(obj: &email_text, rect: CGRect(x: 40, y: 90, width: 60, height: 20) , text: "이메일")
        self.addLabel(obj: &autoR_text, rect: CGRect(x: 40, y: 140, width: 60, height: 20) , text: "자동갱신")
        self.addLabel(obj: &termR_text, rect: CGRect(x: 40, y: 190, width: 60, height: 20) , text: "갱신주기")
        
        self.addLabel(obj: &autoR_result, rect: CGRect(x: 230, y: 140, width: 60, height: 20) , text: "갱신됨")
        self.addLabel(obj: &termR_result, rect: CGRect(x: 230, y: 190, width: 60, height: 20) , text: "0분마다")
        
        //나머지 객체들 등록
        email_field = UITextField(frame: CGRect(x: 120, y: 90, width: 150, height: 20))
        email_field.borderStyle = .roundedRect
        email_field.adjustsFontSizeToFitWidth = true
        self.view.addSubview(email_field)
        
        autoR_switch = UISwitch(frame: CGRect(x: 120, y: 140, width: 60, height: 20))
        autoR_switch.isOn = true
        self.view.addSubview(autoR_switch)
        
        termR_stepper = UIStepper(frame: CGRect(x: 120, y: 190, width: 60, height: 20))
        self.view.addSubview(termR_stepper)
        
        //action들 등록
        termR_stepper.addTarget(self, action: #selector(PorM), for: .valueChanged)
        autoR_switch.addTarget(self, action: #selector(swit), for: .touchUpInside)
        
    }
    
    
}

