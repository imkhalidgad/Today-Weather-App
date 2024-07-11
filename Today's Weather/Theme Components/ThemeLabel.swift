//
//  ThemeLabel.swift
//  CustomSetting
//
//  Created by Khalid Gad on 08/07/2024.
//

import Foundation
import UIKit

class ThemeLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init (coder:aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(self.themeChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    @objc
    func themeChanged(){
        self.textColor = SettingBundleHelper.getTextColor()
        debugPrint("Text = \(self.text) In\n\n color = \(self.textColor)")
    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
}
