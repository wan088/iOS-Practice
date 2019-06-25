//
//  CSStepper.swift
//  CSStepper
//
//  Created by Yongwan on 09/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
@IBDesignable
public class CSStepper: UIControl {
    var leftBtn: UIButton!
    var rightBtn: UIButton!
    var midLbl: UILabel!
    
    @IBInspectable
    public var value: Int = 0{
        didSet{
            self.midLbl.text = "\(value)"
            self.sendActions(for: .valueChanged)
        }
    }
    public var leftBtnText: String = "아래"{
        didSet{
            self.leftBtn.setTitle(self.leftBtnText, for: .normal)
        }
    }
    public var rightBtnText: String = "위"{
        didSet{
            self.rightBtn.setTitle(self.rightBtnText, for: .normal)
        }
    }
    
    public override func layoutSubviews() {
        var height = self.frame.height
        
        leftBtn.frame = CGRect(x: 0, y: 0, width: height, height: height)
        midLbl.frame = CGRect(x: height, y: 0, width: self.frame.width - 2*(height), height: height)
        rightBtn.frame = CGRect(x: self.frame.width - height, y: 0, width: height, height: height)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        leftBtn = UIButton(type: .system)
        rightBtn = UIButton(type: .system)
        midLbl = UILabel()
        
        //setting
        let bw: CGFloat = 0.3
        let bc = UIColor.blue.cgColor
        //leftBtn
        self.leftBtn.setTitle("👎", for: .normal)
        self.leftBtn.layer.borderWidth = bw
        self.leftBtn.layer.borderColor = bc
        self.leftBtn.addTarget(self, action: #selector(valueChanged(_:)), for: .touchUpInside)
        self.leftBtn.tag = -1
        self.addSubview(leftBtn)
        
        
        //rightBtn
        self.rightBtn.setTitle("👍", for: .normal)
        self.rightBtn.layer.borderColor = bc
        self.rightBtn.layer.borderWidth = bw
        self.rightBtn.addTarget(self, action: #selector(valueChanged(_:)), for: .touchUpInside)
        self.rightBtn.tag = 1
        self.addSubview(rightBtn)
        
        //midLbl
        self.midLbl.text = "0"
        self.midLbl.layer.borderColor = bc
        self.midLbl.layer.borderWidth = bw
        self.midLbl.textAlignment = .center
        self.midLbl.font = UIFont.boldSystemFont(ofSize: 16)
        self.midLbl.backgroundColor = .green
        self.addSubview(midLbl)
    }
    @objc func valueChanged(_ sender: UIButton){
        self.value += sender.tag
    }
    
    
}
