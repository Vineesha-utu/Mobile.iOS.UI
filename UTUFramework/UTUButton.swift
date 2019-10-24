//
//  UTUButton.swift
//  UTUButton
//
//  Created by Lakshmana Swamy on 10/14/19.
//  Copyright © 2019 utu. All rights reserved.
//

import Foundation
import UIKit

let kSmall   =  13
let kRegular =  16
let kBig     =  20

public class UTUButton: UIButton {
    public  override init(frame : CGRect) {
        super.init(frame : frame)
    }
    public convenience  init(frame : CGRect, label : String, outlined : Bool, disabled : Bool, size : String ) {
        self.init(frame: frame, label : label, outlined : outlined, disabled: disabled, size: size, isPress : true)
    }
    
    required convenience init(frame : CGRect, label: String, outlined: Bool, disabled: Bool, size: String, isPress : Bool) {
        self.init(frame : frame)
        backgroundColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1)
        setTitle(label, for: .normal)
        layer.cornerRadius = 3.0
        layer.borderWidth = 0.5
        titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
        setTitleColor(.white, for: .normal)
        layer.borderColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1).cgColor //6,179,152
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


