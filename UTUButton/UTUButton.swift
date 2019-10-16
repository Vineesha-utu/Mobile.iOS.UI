//
//  UTUButton.swift
//  UTUButton
//
//  Created by Lakshmana Swamy on 10/14/19.
//  Copyright © 2019 utu. All rights reserved.
//

import Foundation

public class UTUButton: UIButton {
   public static func getOutLinedButton(_ rect: CGRect, title : String) ->  UIButton{
        // Drawing code
        let button = UIButton(frame: rect)
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.setTitleColor(UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1), for: .normal)
        button.layer.borderColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1).cgColor //6,179,152
        button.setTitle(title, for: .normal)
        return button
    }
    public static func getContainedButton(_ rect: CGRect, title : String) ->  UIButton{
        let button = UIButton(frame: rect)
        button.backgroundColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1)
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor(red: 6.0/255.0, green: 179.0/255.0, blue: 152.0/255.0, alpha: 1).cgColor //6,179,152
        button.setTitle(title, for: .normal)
        return button
    }
}

