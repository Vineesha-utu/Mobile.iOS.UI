//
//  UTUButton.swift
//  UTUButton
//
//  Created by Lakshmana Swamy on 10/14/19.
//  Copyright © 2019 utu. All rights reserved.
//

import Foundation
import UIKit
public class UTUButton: UIButton {
    public static func getOutLinedButton(_ rect: CGRect, title : String, size: CGFloat) ->  UIButton{
        // Drawing code
        let button = UIButton(frame: rect)
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: size)
        button.setTitleColor(UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1), for: .normal)
        button.layer.borderColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1).cgColor //6,179,152
        button.setTitle(title, for: .normal)
        return button
    }
    public static func getContainedButton(_ rect: CGRect, title : String,size: CGFloat) ->  UIButton{
        let button = UIButton(frame: rect)
        button.backgroundColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1)
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: size)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1).cgColor //6,179,152
        button.setTitle(title, for: .normal)
        return button
    }
    public convenience override init(frame : CGRect) {
        self.init(frame: frame, label : "Logic", outlined : true, disabled: false, size: "small")
    }
    required init(frame : CGRect, label: String, outlined: Bool, disabled: Bool, size: String) {
        super.init(frame: frame)
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

/*UTUButton(
    label: String,      | "Action" | text to display in the button
    outlined: Boolean,  | false | if true display the button in outlined mode
    disabled: Boolean,  | false | if true button appears in disabled state
    pressed: Boolean,   | false | if true button appears in pressed state
    size: String,       | "regular" | "small", "regular", "big" | choose a button size
)*/
