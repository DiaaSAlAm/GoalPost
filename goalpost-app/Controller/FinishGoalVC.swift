//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by MacBook Pro on 12/20/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var creatGoalBtn: UIButton!
    
    @IBOutlet weak var pointTextField: UITextField!
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       creatGoalBtn.bindToKeyboard()
        pointTextField.delegate = self 
    }
    
    @IBAction func creatGoalBtnWasPressed(_ sender: Any) {
        // Pass data into Core Data Goal Model
        if pointTextField.text != "" {
        self.save { (compelet) in
            if compelet {
                dismiss(animated: true, completion: nil)
            }
        }
        }
        }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        
        dismissDetail()
    }
    func save(completion: (_ finished: Bool) -> () ) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("data saved.")
            completion(true)
        }catch{
            debugPrint("Could not Save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
        
    }
