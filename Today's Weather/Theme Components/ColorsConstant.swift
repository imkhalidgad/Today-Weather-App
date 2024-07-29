//
//  ColorsConstant.swift
//  CustomSetting
//
//  Created by Khalid Gad on 08/07/2024.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    //    func hexStringToUIColor (hex:String) -> UIColor {
    //        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    //
    //        if (cString.hasPrefix("#")) {
    //            cString.remove(at: cString.startIndex)    }
    //        if ((cString.count) != 6) {
    //            return UIColor.gray
    //        }
    //        var rgbValue:UInt64 = 0
    //        Scanner(string: cString).scanHexInt64(&rgbValue)
    //
    //        return UIColor(
    //            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    //            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    //            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    //            alpha: CGFloat(1.0)
    //        )
    //    }
    
}
