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
    @IBOutlet weak var submitBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if(appdata.subCount < 3) {
            newQuestion()
        }
    }
    
    // Tracks whne submit button is pressed
    @IBAction func subPressed(_ sender: UIButton) {
        appdata.subCount += 1
        if(appdata.subCount < 3) {
            newQuestion()
        }
    }
    
    // Displays questions and answers depending on what the user clicks on
    // in the table view
    func newQuestion() {
        var questionAns : [String] = []
        
        switch appdata.topicIdx {
        case 0:
            questionLab.text = appdata.rapQuestions[appdata.subCount]
            appdata.currentQ = appdata.rapQuestions[appdata.subCount]
            if(appdata.subCount == 0) {
                questionAns = appdata.rapAnswers1
                appdata.correctIndex = 0
            }else if (appdata.subCount == 1) {
                questionAns = appdata.rapAnswers2
                appdata.correctIndex = 1
            } else {
                questionAns = appdata.rapAnswers3
                appdata.correctIndex = 2
            }
            ans1.setTitle(questionAns[0], for: .normal)
            ans2.setTitle(questionAns[1], for: .normal)
            ans3.setTitle(questionAns[2], for: .normal)
            ans4.setTitle(questionAns[3], for: .normal)
        case 1:
            questionLab.text = appdata.karQuestions[appdata.subCount]
            appdata.currentQ = appdata.karQuestions[appdata.subCount]
            if(appdata.subCount == 0) {
                questionAns = appdata.karAnswers1
                appdata.correctIndex = 3
            }else if (appdata.subCount == 1) {
                questionAns = appdata.karAnswers2
                appdata.correctIndex = 4
            } else {
                questionAns = appdata.karAnswers3
                appdata.correctIndex = 5
            }
            ans1.setTitle(questionAns[0], for: .normal)
            ans2.setTitle(questionAns[1], for: .normal)
            ans3.setTitle(questionAns[2], for: .normal)
            ans4.setTitle(questionAns[3], for: .normal)
        default:
            questionLab.text = appdata.hungQuestions[appdata.subCount]
            appdata.currentQ = appdata.hungQuestions[appdata.subCount]
            if(appdata.subCount == 0) {
                questionAns = appdata.hungAnswers1
                appdata.correctIndex = 6
            }else if (appdata.subCount == 1) {
                questionAns = appdata.hungAnswers2
                appdata.correctIndex = 7
            } else {
                questionAns = appdata.hungAnswers3
                appdata.correctIndex = 8
            }
            ans1.setTitle(questionAns[0], for: .normal)
            ans2.setTitle(questionAns[1], for: .normal)
            ans3.setTitle(questionAns[2], for: .normal)
            ans4.setTitle(questionAns[3], for: .normal)
        }
    }
    
    // Selecting and deselcting the chosen values by the user
    @IBAction func ansSelected(_ sender: UIButton) {
        appdata.chosenAns = sender.currentTitle!
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
            prevChosenCase = 1
            break
        case 2:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            prevChosenCase = 2
            break
        case 3:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            prevChosenCase = 3
            break
        case 4:
            sender.backgroundColor = UIColor.lightGray
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            prevChosenCase = 4
            break
        default:
            print("Default Case")
        }
    }

}

