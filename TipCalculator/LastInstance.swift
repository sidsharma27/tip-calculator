//
//  LastTime.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 8/21/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import Foundation
import UIKit

class LastInstance {
    let defaults = UserDefaults.standard
    
    func set(for viewController: UIViewController, lastTotalKey: String, lastTimestamp:NSDate) {
            defaults.set(lastTotalKey, forKey: "lastTotalKey")
        
            defaults.synchronize()
    }
    static let instance = LastInstance()
}
