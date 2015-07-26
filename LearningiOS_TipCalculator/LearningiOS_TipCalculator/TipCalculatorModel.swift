//
//  TipCalculatorModel.swift
//  LearningiOS_TipCalculator
//
//  Created by Carl Yi on 15/7/26.
//  Copyright (c) 2015年 Carl Yi. All rights reserved.
//


import Foundation

class TipCalculatorModel{
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct (tipPac: Double) -> Double{
        return subtotal * tipPac
    }
    
    func returnPossibleTips() -> Dictionary<Int, Double>{
        let PossibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        var retval = Dictionary<Int, Double>()
        for possibleTip in PossibleTipsInferred{
            let intPct = Int( possibleTip*100 )
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
    
    
}

//let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
//tipCalc.returnPossibleTips()