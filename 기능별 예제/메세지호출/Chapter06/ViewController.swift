//
//  ViewController.swift
//  Chapter06
//
//  Created by Yongwan on 08/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    @IBOutlet var inputText: UITextField!
    @IBOutlet var datePick: UIDatePicker!
    
    @IBOutlet var label: UILabel!
    
    
    @IBAction func register(_ sender: Any) {
        let date = datePick.date
        if let text = inputText.text {
            if text == "" {
                let alert = UIAlertController(title: "미리알림", message: "혹시 텍스트를 안넣으셨나요? 넣어주세요", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "취소", style: .cancel)
                alert.addAction(cancel)
                self.present(alert, animated: true)
                
            }else{
                let center = UNUserNotificationCenter.current()
                center.getNotificationSettings(){(setting) in
                    if setting.authorizationStatus == .authorized{
                        DispatchQueue.main.async {
                            let content = UNMutableNotificationContent()
                            content.badge = 1
                            content.title = "미리알림"
                            content.body = text
                            
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow, repeats: false)
                            
                            let request = UNNotificationRequest(identifier: "미리알림", content: content, trigger: trigger)
                            
                            center.add(request){(_) in
                                DispatchQueue.main.async {
                                    let msg = "\(self.inputText.text!) 알림이 \(self.datePick.date.addingTimeInterval(9*60*60)) 에 울릴것입니다!"
                                    let alert = UIAlertController(title: "확인", message: msg, preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "확인", style: .default)
                                    
                                    alert.addAction(ok)
                                    self.present(alert, animated: true)
                                }
                                
                            }
                        }
                        
                    }else{
                        print("이번에도이군")
                    }
                    
                }
            }
        }
    }
    
    @IBAction func Alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "첫알람", message: "Hello World?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){(_) in
            guard let id = alert.textFields?[0] else{
                return
            }
            guard let password = alert.textFields?[1] else{
                return
            }
            
            if id.text! == "kyw088" && password.text! == "dlenqn1"{
                self.label.text = "인증됨"
            }
        }
        
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addTextField(){(tf) in
            tf.placeholder = "아이디"
        }

        alert.addTextField(){(tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        }
        
        self.present(alert, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

