//
//  DefaultCurrency.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 8/24/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import Foundation
import UIKit

class DefaultCurrency {
    let defaults = UserDefaults.standard
    
    func set(for viewController: UIViewController, currency: Int) {
        if (currency == 0) {
            defaults.set(0, forKey: "currencyIndex")
            defaults.synchronize()
            print("0")
            
        } else if (currency == 1) {
            defaults.set(1, forKey: "currencyIndex")
            defaults.synchronize()
            print("1")
        } else if (currency == 2) {
            defaults.set(2, forKey: "currencyIndex")
            defaults.synchronize()
            print("2")
        } else {
            defaults.set(3, forKey: "currencyIndex")
            defaults.synchronize()
            print("3")
        }
    }
    static let instance = DefaultCurrency()
}
