//
//  QAViewController.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 11/6/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {
    var appdata = AppData.shared
    var prevChosenCase = -1
    
    @IBOutlet weak var questionLab: UILabel!
    @IBOutlet weak var ans1: UIButton!
    @IBOutlet weak var ans2: UIButton!
    @IBOutlet weak var ans3: UIButton!
    @IBOutlet weak var ans4: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let maxQuestions = appdata.categories[appdata.topicIdx].allQuestionData.count
        if(appdata.subCount < maxQuestions) {
            newQuestion()
        }
    }
    
    // Tracks whne submit button is pressed
    @IBAction func subPressed(_ sender: UIButton) {
        appdata.subCount += 1
        let maxQuestions = appdata.categories[appdata.topicIdx].allQuestionData.count
        if(appdata.subCount < maxQuestions) {
            newQuestion()
        }
        
    }
    
    // Displays questions and answers depending on what the user clicks on
    // in the table view
    func newQuestion() {
        appdata.chosenAns = ""
        let category = appdata.categories[appdata.topicIdx]
        let questionIndex = appdata.questionNum
        questionLab.text = category.allQuestionData[questionIndex].question
        appdata.currentQ = category.allQuestionData[questionIndex].question
        let currentAnswers = category.allQuestionData[questionIndex].answers
        
        ans1.setTitle(currentAnswers[0], for: .normal)
        ans1.titleLabel?.adjustsFontSizeToFitWidth = true
        ans2.setTitle(currentAnswers[1], for: .normal)
        ans2.titleLabel?.adjustsFontSizeToFitWidth = true
        ans3.setTitle(currentAnswers[2], for: .normal)
        ans3.titleLabel?.adjustsFontSizeToFitWidth = true
        ans4.setTitle(currentAnswers[3], for: .normal)
        ans4.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
  
    // Selecting and deselcting the chosen values by the user
    @IBAction func ansSelected(_ sender: UIButton) {
        appdata.chosenAns = sender.currentTitle!
        appdata.selectionMade = true
        submitButton.isEnabled = true
        
        if(prevChosenCase != -1) {
            let button = self.view.viewWithTag(prevChosenCase) as! UIButton
            let color = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            button.backgroundColor = nil
            button.setTitleColor(color, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        }
        switch sender.tag {
        case 1:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            sender.titleLabel?.adjustsFontSizeToFitWidth = true
            prevChosenCase = 1
            break
        case 2:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            sender.titleLabel?.adjustsFontSizeToFitWidth = true
            prevChosenCase = 2
            break
        case 3:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            sender.titleLabel?.adjustsFontSizeToFitWidth = true
            prevChosenCase = 3
            break
        case 4:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            sender.titleLabel?.adjustsFontSizeToFitWidth = true
            prevChosenCase = 4
            break
        default:
            print("Default Case")
        }
    }

}

