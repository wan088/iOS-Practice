import UIKit

class VC2: UIViewController{
    var resultE: String = ""
    var resultU: String = ""
    var resultI: Int = 0
    
    
    @IBOutlet var resultValue: UILabel!
    
    override func viewDidLoad() {
        self.resultValue.text = "\(resultE)로 \(resultU)으로 \(resultI)마다 보내도록 하자"
    }
}
