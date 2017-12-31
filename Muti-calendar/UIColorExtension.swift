//
//  UIColorExtension.swift
//  Muti-calendar
//
//  Created by Apple on 2017/12/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithHexString(hex: String) ->UIColor {
        
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            //let index = cString.index(cString.startIndex, offsetBy:1)
            //cString = cString.substring(from: index)
            cString = String(cString.dropFirst(1))
        }
        else if cString.hasPrefix("0x") || cString.hasPrefix("0X") {
            cString = String(cString.dropFirst(2))
        }
        
        if (cString.count != 6) {
            return UIColor.black
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
