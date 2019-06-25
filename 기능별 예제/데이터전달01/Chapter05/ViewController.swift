//
//  ViewController.swift
//  Chapter05
//
//  Created by Yongwan on 07/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdated: UISwitch!
    @IBOutlet var minPlus: UIStepper!
    @IBOutlet var nowUpdated: UILabel!
    @IBOutlet var nowMin: UILabel!
    
    @IBAction func updatedChange(_ sender: UISwitch) {
        if sender.isOn {
            nowUpdated.text = "자동"
        }else{
            nowUpdated.text = "수동"
        }
    }
    @IBAction func PorM(_ sender: UIStepper) {
        var min = Int(sender.value)
        nowMin.text = "\(min) 분마다"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        
        NSLog("여기냐 \n")
        
        guard let rvc = dest as? VC2 else{
            return
        }
        rvc.resultE = email.text!
        rvc.resultU = nowUpdated.text!
        rvc.resultI = Int(minPlus.value)
        
        
    }
    
    @IBAction func performSegue(_ sender: Any) {
        //self.performSegue("ManualS")
        NSLog("혹시 여기냐 \n")
        self.performSegue(withIdentifier: "ManualS", sender: self)
    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "rvc") as? VC2 else{
            return
        }
        
        rvc.resultE = email.text!
        rvc.resultU = nowUpdated.text!
        rvc.resultI = Int(minPlus.value)
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("asd")
        // Do any additional setup after loading the view.
    }


}

