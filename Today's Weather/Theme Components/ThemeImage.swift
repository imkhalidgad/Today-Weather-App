//
//  ThemeImage.swift
//  Today's Weather
//
//  Created by Khalid Gad on 11/07/2024.
//

import Foundation
import UIKit

class ThemeImage : UIImageView {
    required init? (coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector (self.themeChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    @objc
    func themeChanged(){
        self.tintColor = SettingBundleHelper.getViewColor()
    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
}
