//
//  CreatGoalVC.swift
//  goalpost-app
//
//  Created by MacBook Pro on 12/19/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTextVIew: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextVIew.delegate = self
    
        
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
    goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextVIew.text != "" && goalTextVIew.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTextVIew.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextVIew.text = ""
        goalTextVIew.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
