//  ViewController.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 6/23/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import UIKit

class TipViewController: UIViewController   {
    
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var onePerson: UILabel!
    @IBOutlet weak var twoPeople: UILabel!
    @IBOutlet weak var threePeople: UILabel!
    
    
    @IBAction func tip(_ sender: Any) {
        logic()
    }
    @IBOutlet weak var bottomView: UIView!
    
    var originalBottomViewRec : CGRect = CGRect.zero
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefaults()
        logic()
        originalBottomViewRec = self.bottomView.frame
        totalAmount.becomeFirstResponder()
        amountChanged(NSNull.self)
    }
    
    
    
    @IBAction func amountChanged(_ sender: Any) {
        if (totalAmount.text?.isEmpty)! {
            UIView.animate(withDuration: 0.4, animations: {
                self.bottomView.isHidden = true
            })
            
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.bottomView.isHidden = false
            })
            
            
        }
    }
    
    func applicationDidEnterBackground() {
        let lastTotal = self.totalAmount.text
        let lastTimestamp = NSDate()
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        
        
        let defaults = UserDefaults.standard
        
        LastInstance.instance.set(for: self, lastTotalKey: lastTotal!, lastTimestamp: lastTimestamp)
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer() //For user's tap interaction
        tapRecognizer.addTarget(self, action: #selector(TipViewController.tappedOutside)) //Adds a target (ViewController) and an action (tappedOutside) to a gesture-recognizer object.
        self.view.addGestureRecognizer(tapRecognizer) //add the Gesture recognizer to the UIView
    }
    
    
    func logic() {
        let tipPercent = [0.10,0.15,0.20,0.25] //tip percentages matching segmented control index
        let bill = Double(totalAmount.text!) ?? 0 //gets the user input for bill amount (if no user input then automatically == 0
        let tip = bill * tipPercent[tipAmount.selectedSegmentIndex] //assign the user selected tip value via segment control object
        let total = bill + tip
        onePerson.text = String(format: "$%.02f", total)
        twoPeople.text = String(format: "$%.02f", (total/2))
        threePeople.text = String(format: "$%.02f", (total/3))
        
        tipLabel.text = String(format: "$%.02f", tip)
        totalLabel.text = String(format: "$%.02f", total)
    }
    
    func setDefaults() {
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "tipIndex")
        let theme = defaults.integer(forKey: "themeIndex")
        DefaultTip.instance.set(for: self, tip: tipIndex)
        tipAmount.selectedSegmentIndex = tipIndex
        ColorScheme.instance.set(for: self, theme: theme)
        
        if theme != 0 {
            bottomView.backgroundColor = UIColor.lightGray
        } else {
            bottomView.backgroundColor = UIColor.white
        }
        
    }
    
    func tappedOutside(){
        self.view.endEditing(true)
        //bottomView.isHidden = true
    }
}

