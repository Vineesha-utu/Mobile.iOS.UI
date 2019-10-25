//
//  UTUButton.swift
//  UTUButton
//
//  Created by Lakshmana Swamy on 10/14/19.
//  Copyright © 2019 utu. All rights reserved.
//

import Foundation
import UIKit

let kSmall   =  14.0
let kRegular =  14.0
let kBig     =  16.0
let kFontRegular = "NotoSans-Bold"

public class UTUButton: UIButton {
    public  override init(frame : CGRect) {
        super.init(frame : frame)
    }
    public convenience  init(frame : CGRect, label : String, outlined : Bool, disabled : Bool, size : String ) {
        self.init(frame: frame, label : label, outlined : outlined, disabled: disabled, size: size, isPress : true)
    }
    
    required convenience init(frame : CGRect, label: String, outlined: Bool, disabled: Bool, size: String, isPress : Bool) {
        self.init(frame : frame)
        setTitle(label, for: .normal)
        layer.cornerRadius = 3.0
        if size == "small" {
            titleLabel?.font = UIFont(name: kFontRegular, size: CGFloat(kSmall))
        }else if size == "regular" {
            titleLabel?.font = UIFont(name: kFontRegular, size: CGFloat(kRegular))
        }else if size == "big" {
            titleLabel?.font = UIFont(name: kFontRegular, size: CGFloat(kBig))
        }
        if outlined {
            layer.borderColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1).cgColor //6,179,152
            setTitleColor(UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1), for: .normal)
            backgroundColor = UIColor.clear
            layer.borderWidth = 0.5
            
        }else{
            backgroundColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1)
            setTitleColor(.white, for: .normal)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


