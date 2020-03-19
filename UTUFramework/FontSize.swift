//
//  FontSize.swift
//  UTUTaxFree
//
//  Created by madhu kiran on 05/02/20.
//  Copyright © 2020 utu. All rights reserved.
//

import Foundation

//extension UIFont {
//    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
//        return NSString(string: string).boundingRect(with: CGSize(width: width, height: DBL_MAX),
//                                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
//                                                     attributes: [NSAttributedString.Key.font: self],
//            context: nil).size
//    }
//}

extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
/*
 open func titleLabelRectForBounds(_ bounds: CGRect, editing: Bool) -> CGRect {
     if editing {
         self.clearBtn.isHidden = false
         let font = UIFont(name: UTUFontNames.NotoSansRegular, size: 12)
         let textwidth = self.titleLabel.text!.size(OfFont: font!).width
         return CGRect(x: 15, y: bounds.origin.y-7, width: textwidth, height: titleHeight())
     }
     self.clearBtn.isHidden = true
     return CGRect(x: 0, y: titleHeight(), width: bounds.size.width, height: titleHeight())
 }
 
 */
