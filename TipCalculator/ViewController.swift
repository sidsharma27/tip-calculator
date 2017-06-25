//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sidharth Sharma on 6/23/17.
//  Copyright © 2017 Sidharth Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func tip(_ sender: Any) {
        let tipPercent = [0.10,0.15,0.20,0.25] //tip percentages matching segmented control index
        let bill = Double(totalAmount.text!) ?? 0 //gets the user input for bill amount (if no user input then automatically == 0
        let tip = bill * tipPercent[tipAmount.selectedSegmentIndex] //assign the user selected tip value via segment control object
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.02f", tip)
        totalLabel.text = String(format: "$%.02f", total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer() //For user's tap interaction
        tapRecognizer.addTarget(self, action: #selector(ViewController.tappedOutside)) //Adds a target (ViewController) and an action (tappedOutside) to a gesture-recognizer object.
        self.view.addGestureRecognizer(tapRecognizer) //add the Gesture recognizer to the UIView
    }
    
    func tappedOutside(){
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

