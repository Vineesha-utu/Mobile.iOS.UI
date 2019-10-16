//
//  UTUButtonView.swift
//  UTUButton
//
//  Created by Lakshmana Swamy on 10/14/19.
//  Copyright © 2019 utu. All rights reserved.
//

import UIKit

public class UTUButtonView: UIView {


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public func draw(_ rect: CGRect, title : String) {
        // Drawing code
        let button = UIButton(frame: rect)
        button.backgroundColor = .red
        button.setTitle(title, for: .normal)
        self.addSubview(button)
    }
 

}
