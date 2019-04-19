import UIKit

class FormViewController: UIViewController{
    @IBOutlet var inputEmail: UITextField!
    @IBOutlet var inputUpdate: UISwitch!
    @IBOutlet var inputInter: UIStepper!
    
    @IBAction func back(_ sender: Any) {
        guard let rvc = self.presentingViewController else {
            return
        }
        
        let ud = UserDefaults.standard
        ud.set(self.inputEmail.text, forKey: "e")
        ud.set(self.inputUpdate.isOn, forKey: "u")
        ud.set(Int(self.inputInter.value), forKey: "i")
        
        
        rvc.dismiss(animated: true)
    }
    
    
}
