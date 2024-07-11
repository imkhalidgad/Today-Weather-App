//
//  ThemeView.swift
//  CustomSetting
//
//  Created by Khalid Gad on 08/07/2024.
//

import Foundation
import UIKit

class ThemeView : UIView {
    required init? (coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector (self.themeChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    @objc
    func themeChanged(){
        self.backgroundColor = SettingBundleHelper.getViewColor()
    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
}
