//
//  ViewController.swift
//  TipCalculator
//
//  Created by Main Account on 7/7/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var totalTextField : UITextField!
  @IBOutlet var taxPctSlider : UISlider!
  @IBOutlet var taxPctLabel : UILabel!
  @IBOutlet var resultsTextView : UITextView!
  let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
 
  func refreshUI() {
    // 1
    totalTextField.text = String(stringInterpolationSegment: tipCalc.total)
    // 2
    taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
    // 3
    taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
    // 4
    resultsTextView.text = ""
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    refreshUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func calculateTapped(sender : AnyObject) {
    // 1
   tipCalc.total = (totalTextField.text as NSString).doubleValue
    //tipCalc.total = Double(totalTextField.text._bridgeToObjectiveC().doubleValue,)
    // 2
    let possibleTips = tipCalc.returnPossibleTips()
    var results = ""
    // 3
    for (tipPct, tipValue) in possibleTips {
      // 4
      results += "\(tipPct)%: \(tipValue)\n"
    }
    // 5
    resultsTextView.text = results

  }
  @IBAction func taxPercentageChanged(sender : AnyObject) {
    tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
    refreshUI()
  }
  @IBAction func viewTapped(sender : AnyObject) {
    totalTextField.resignFirstResponder()
  }

}

