//
//  ColorScheme.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 7/30/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import Foundation
import UIKit

class ColorScheme {
    let defaults = UserDefaults.standard

    func set(for viewController: UIViewController, theme: Int) {
        if (theme == 0) {
            viewController.view.backgroundColor = UIColor.cyan
            defaults.set(0, forKey: "themeIndex")
            defaults.synchronize()
            
        } else {
            viewController.view.backgroundColor = UIColor.gray
            defaults.set(1, forKey: "themeIndex")
            defaults.synchronize()
        }
    }
    static let instance = ColorScheme()
}
