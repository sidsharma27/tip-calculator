//
//  DefaultTip.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 7/30/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import Foundation
import UIKit

class DefaultTip {
    let defaults = UserDefaults.standard
    
    func set(for viewController: UIViewController, tip: Int) {
        if (tip == 0) {
            defaults.set(0, forKey: "tipIndex")
            defaults.synchronize()
            print("0")
        } else if (tip == 1) {
            defaults.set(1, forKey: "tipIndex")
            defaults.synchronize()
            print("1")
        } else if (tip == 2) {
            defaults.set(2, forKey: "tipIndex")
            defaults.synchronize()
            print("2")
        } else {
            defaults.set(3, forKey: "tipIndex")
            defaults.synchronize()
            print("3")
        }
    }
    static let instance = DefaultTip()
}
