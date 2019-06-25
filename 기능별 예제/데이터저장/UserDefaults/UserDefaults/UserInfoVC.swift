
//
//  UserInfoVC.swift
//  UserDefaults
//
//  Created by Yongwan on 15/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Foundation
class UserInfoVC: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var defaultPlist: NSDictionary!
    var emails: [String] = []
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.emailField.text = emails[row]
        var plist = UserDefaults.standard
        plist.set(emails[row], forKey: "selectedAccount")
        plist.synchronize()
        print(emails[row])
        //경로 확인해서 name 란 채워넣자
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
        var pl = (path?.strings(byAppendingPaths: ["\(emails[row]).plist"]).first)!
        if let data = NSDictionary(contentsOfFile: pl){
            
            self.name.text = data.value(forKey: "name") as? String
            if let oo = data.value(forKey: "married") as? Bool{
                self.swit.isOn = oo
            }
            if let oo = data.value(forKey: "gender") as? Int{
                self.seg.selectedSegmentIndex = oo
            }
        }
    
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emails.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return emails[row]
    }
    
    enum genderType{
        case man
        case woman
    }
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var name: UILabel!
    
    @IBOutlet var seg: UISegmentedControl!
    @IBOutlet var swit: UISwitch!
    @IBAction func nameTouched(_ sender: UITapGestureRecognizer) {
        var alert = UIAlertController(title: "이름 설정", message: nil, preferredStyle: .alert)
        alert.addTextField(){
            $0.placeholder = "홍길동"
        }
        var ok = UIAlertAction(title: "OK", style: .default){(_) in
            var input = alert.textFields?[0].text
            self.name.text = input
            guard let x = self.emailField.text else{return}
            
            var fileName = "\(self.emailField.text!).plist"
            var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
            
            var plist = (path?.strings(byAppendingPaths: [fileName]).first)!
            
            var data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
            data.setValue(input, forKey: "name")
            
            data.write(toFile: plist, atomically: true)
            
        
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    @IBAction func married(_ sender: UISwitch) {
        
        var fileName = UserDefaults.standard.string(forKey: "selectedAccount")! + ".plist"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
        var plist = (path?.strings(byAppendingPaths: [fileName]).first)!
        
        var data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
        data.setValue(sender.isOn, forKey: "married")
        data.write(toFile: plist, atomically: true)
        print("custom plist = \(plist)")
    }

    @IBAction func gender(_ sender: UISegmentedControl) {
        var gen = sender.selectedSegmentIndex == 0 ? "남자" : "여자"
        var fname = UserDefaults.standard.string(forKey: "selectedAccount")! + ".plist"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
        var plist = (path?.strings(byAppendingPaths: [fname]).first)!
        
        var data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
        
        data.setValue(sender.selectedSegmentIndex, forKey: "gender")
        data.write(toFile: plist, atomically: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues();
        var pat = Bundle.main.path(forResource: "defaultPlist", ofType: "plist")!
        self.defaultPlist = NSDictionary(contentsOfFile: pat)!
        
        //email 리스트 읽어오기
        var plist = UserDefaults.standard
        self.emails = plist.array(forKey: "accounts") as? [String] ?? [String]()
        
        if let account = plist.string(forKey: "selectedAccount"){
            self.emailField.text = account
            
            var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
            var pl = (path?.strings(byAppendingPaths: ["\(account).plist"]).first)!
            var data = NSMutableDictionary(contentsOfFile: pl) ?? NSMutableDictionary()
            
            if let name = data.value(forKey: "name") as? String{
                self.name.text = name
            }
            if let marr = data.value(forKey: "married") as? Bool{
                self.swit.isOn = marr
            }
        }

            
        //picker 설정
        var picker = UIPickerView()
        self.emailField.inputView = picker
        picker.delegate = self
        
        // toolbar 설정
        var toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        self.emailField.inputAccessoryView = toolbar
        
        var done = UIBarButtonItem()
        done.title = "done"
        done.target = self
        done.action = #selector(endEditing)
        
        var flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        var new = UIBarButtonItem(title: "new", style: .done, target: self, action: #selector(newUser(_:)))
        toolbar.setItems([new,flex,done], animated: true)
        
    
    }
    
    @objc func newUser(_ sender: Any){
        var alert = UIAlertController(title: "새 계정을 입력하세요", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: {sender in
            sender.placeholder = "이메일"
        })
        var ok = UIAlertAction(title: "확인", style: .default){act in
            
            if let em = alert.textFields?[0].text{
                self.emails.append(em)
                self.emailField.text = em
                
                //email 리스트 갱신
                var plist = UserDefaults.standard
                plist.setValue(self.emails, forKey: "accounts")
                plist.setValue(em, forKey: "selectedAccount")
                plist.synchronize()
                
                var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as! NSString
                var pl = (path.strings(byAppendingPaths: ["\(em).plist"]).first)!
                var data = NSMutableDictionary(contentsOfFile: pl) ?? NSMutableDictionary(dictionary: self.defaultPlist)
                data.setValue(false, forKey: "married")
                data.setValue("", forKey: "name")
                data.setValue(0, forKey: "gender")
                
                data.write(toFile: pl, atomically: true)
                
                self.name.text = ""
                self.swit.isOn = false
                self.seg.selectedSegmentIndex = 0
            }
            self.view.endEditing(true)
        }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    @objc func endEditing(_ sender: Any){
        self.view.endEditing(true)
    }
    
    func initValues(){
        let plist = UserDefaults.standard
        self.name.text = plist.string(forKey: "이름")

    }


    
}
