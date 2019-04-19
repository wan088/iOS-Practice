//
//  ViewController.swift
//  Chapter07
//
//  Created by Yongwan on 09/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var tf: UITextField!
    @IBOutlet var iv: UIImageView!
    
    @IBAction func pick(_ sender: Any){
        let pker = UIImagePickerController()
        pker.allowsEditing = true;
        pker.delegate = self
        self.present(pker, animated: false)
        
    }
    
    
    
    @IBAction func confirm(_ sender: Any){
        self.tf.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tf.delegate = self
        tf.placeholder = "값을 입력하세요"
        tf.keyboardType = .alphabet
        tf.keyboardAppearance = .dark
        tf.enablesReturnKeyAutomatically = true;
        
        tf.borderStyle = .line
        tf.textAlignment = .center
        tf.contentVerticalAlignment = .center
        tf.contentHorizontalAlignment = .center
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.borderWidth = 2.0
        
        self.tf.becomeFirstResponder()
    }


}
//MARK:- 이미지피커컨트롤러델리게이트
extension ViewController: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("ok")
        picker.dismiss(animated: true){
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.iv.image = img
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled")
        picker.dismiss(animated: true){
            let alarm = UIAlertController(title: "사진", message: "사진이 취소되었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alarm.addAction(action)
            self.present(alarm, animated: true)
        }
        
    }
}
//MARK:- 네비게이션 컨트롤러 델리게이트
extension ViewController: UINavigationControllerDelegate{
    
}
//MARK:- 텍스트필드 딜레기읕
extension ViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("편집이 시작될라함")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("start edit")
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("삭제하면 안됨")
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 내용이 \(string)으로 변경되었음!")
        if Int(string) != nil
        {
            return false
        }
        if (textField.text?.count)! + string.count > 10 {
            return false
        }
        return true
    }
}
