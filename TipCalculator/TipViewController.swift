//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 6/23/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import UIKit
import CoreData

class TipViewController: UIViewController   {
    
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var lastRun = UserDefaults.standard
    
    var lastRunInfo = [LastRun]()
    
    @IBAction func tip(_ sender: Any) {
        logic()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        lastRun = UserDefaults.standard
        let total = lastRun.string(forKey: totalAmount.text!)
        
        
        
        let tapRecognizer = UITapGestureRecognizer() //For user's tap interaction
        tapRecognizer.addTarget(self, action: #selector(TipViewController.tappedOutside)) //Adds a target (ViewController) and an action (tappedOutside) to a gesture-recognizer object.
        self.view.addGestureRecognizer(tapRecognizer) //add the Gesture recognizer to the UIView
        
        let fetchRequest: NSFetchRequest<LastRun> = LastRun.fetchRequest()
        
        do {
            let settings =  try PersistanceService.context.fetch(fetchRequest)
            self.lastRunInfo = settings
            if !lastRunInfo.isEmpty {
                totalAmount.text = lastRunInfo[0].billAmount!
            }

        } catch { print("Error")}
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setSegmentIndex()
        logic()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        let lastRun = LastRun(context: PersistanceService.context)
        lastRun.billAmount = totalAmount.text
        PersistanceService.saveContext()
        self.lastRunInfo[0] = lastRun
        print(lastRun)
        print(self.lastRunInfo[0])
    }
    
    func logic() {
        let tipPercent = [0.10,0.15,0.20,0.25] //tip percentages matching segmented control index
        let bill = Double(totalAmount.text!) ?? 0 //gets the user input for bill amount (if no user input then automatically == 0
        let tip = bill * tipPercent[tipAmount.selectedSegmentIndex] //assign the user selected tip value via segment control object
        let total = bill + tip
    
        tipLabel.text = String(format: "$%.02f", tip)
        totalLabel.text = String(format: "$%.02f", total)
    }
    
    func setSegmentIndex() {
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "tipIndex")
        switch tipIndex {
            case 0:
                print("0")
                tipAmount.selectedSegmentIndex = 0
            case 1:
                print("1")
                tipAmount.selectedSegmentIndex = 1
            case 2:
                print("2")
                tipAmount.selectedSegmentIndex = 2
            case 3:
                print("3")
                tipAmount.selectedSegmentIndex = 3
            default:
                break
        }
    }
    
    func tappedOutside(){
        self.view.endEditing(true)
    }
}

