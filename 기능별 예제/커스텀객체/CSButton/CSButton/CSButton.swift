//
//  CSButton.swift
//  CSButton
//
//  Created by Yongwan on 06/06/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import CoreML
class CSButton: UIButton {
    var count = 0

    enum CSButtonType{
        case rect
        case circle
        
    }
    var type: CSButtonType = .circle{
        didSet{
            switch type{
            case .rect :
                self.backgroundColor = .black
                self.layer.cornerRadius = 0
            case .circle :
                self.backgroundColor = .black
                self.layer.cornerRadius = 3
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .green
        self.setTitle("0번 클릭함", for: .normal)
        self.layer.borderWidth=3
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
        
    }
    @objc func counting(_ sender: CSButton){
        sender.count+=1
        self.setTitle("\(count)번 클릭함", for: .normal)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
    }
    
    init(){
        super.init(frame: CGRect.zero)
    }
    
    convenience init(type: CSButtonType){
        self.init()
        switch type{
        case .rect :
            self.backgroundColor = .black
            self.layer.cornerRadius = 0
        case .circle :
            self.backgroundColor = .black
            self.layer.cornerRadius = 3
            
            
        }
    }

}
