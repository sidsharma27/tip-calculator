//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 6/24/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTheme: UISegmentedControl!
    @IBOutlet weak var defaultTip: UISegmentedControl!
    var defaults = UserDefaults.standard
    
    @IBAction func changeDefaultTheme(_ sender: Any) {
        switch defaultTheme.selectedSegmentIndex {
            case 0:
                print("light")
                ColorScheme.instance.set(for: self, theme: defaultTheme.selectedSegmentIndex)
                defaults.set(0, forKey: "themeIndex")
                defaults.synchronize()
            case 1:
                print("dark")
                ColorScheme.instance.set(for: self, theme: defaultTheme.selectedSegmentIndex)
                defaults.set(1, forKey: "themeIndex")
                defaults.synchronize()
            default:
                break
        }
    }
    @IBAction func changeDefaultTip(_ sender: Any) {
        switch defaultTip.selectedSegmentIndex {
            case 0:
                print("10")
                defaults.set(0, forKey: "tipIndex")
                defaults.synchronize()
            case 1:
                print("15")
                defaults.set(1, forKey: "tipIndex")
                defaults.synchronize()
            case 2:
                print("20")
                defaults.set(2, forKey: "tipIndex")
                defaults.synchronize()
            case 3:
                print("25")
                defaults.set(3, forKey: "tipIndex")
                defaults.synchronize()
            default:
                break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "tipIndex")
        switch tipIndex {
            case 0:
                print("0")
                defaultTip.selectedSegmentIndex = 0
            case 1:
                print("1")
                defaultTip.selectedSegmentIndex = 1
            case 2:
                print("2")
                defaultTip.selectedSegmentIndex = 2
            case 3:
                print("3")
                defaultTip.selectedSegmentIndex = 3
            default:
                break
        }
        
        let themeIndex = defaults.integer(forKey: "themeIndex")
        switch themeIndex {
            case 0:
                print("0")
                defaultTheme.selectedSegmentIndex = 0
            case 1:
                print("1")
                defaultTheme.selectedSegmentIndex = 1
            default:
                break
        }
        
        DefaultTip.instance.set(for: self, tip: tipIndex)
        ColorScheme.instance.set(for: self, theme: themeIndex)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
