//
//  AnswerViewController.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 11/6/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
    var appdata = AppData.shared
    
    @IBOutlet weak var questionLab: UILabel!
    @IBOutlet weak var wrongRightLab: UILabel!
    @IBOutlet weak var rightAnsLab: UILabel!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLab.text = appdata.currentQ
        let maxQuestions = appdata.categories[appdata.topicIdx].allQuestionData.count
        if(appdata.subCount >= maxQuestions - 1) {
            nextBtn.setTitle("See Results", for: .normal)
        }
        popAns()
    }
    
    // Segues to the final screen when the user wants to see their results
    @IBAction func makeSegFinal(_ sender: UIButton) {
        if(sender.titleLabel!.text == "See Results") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let newController = storyboard.instantiateViewController(withIdentifier: "FinalView")
            self.present(newController, animated: true, completion: nil)
        }
    }
    
    // Displays whether or not the user got the answer right or not
    // as well as the correct answer
    func popAns() {
        let category = appdata.categories[appdata.topicIdx]
        let questionIndex = appdata.questionNum
        let currentQ = category.allQuestionData[questionIndex]
        if (appdata.chosenAns == currentQ.answers[currentQ.answerIndex - 1]) {
            appdata.score += 1
            wrongRightLab.text = "You got it dude!"
            let color = UIColor(red:0.05, green:0.56, blue:0.04, alpha:1.0)
            wrongRightLab.textColor = color
            wrongRightLab.font = UIFont.boldSystemFont(ofSize: 19)
        }else {
            wrongRightLab.text = "Nope!"
            wrongRightLab.textColor = UIColor.red
            wrongRightLab.font = UIFont.boldSystemFont(ofSize: 19)
        }
        rightAnsLab.text = currentQ.answers[currentQ.answerIndex - 1]
               // moving on to next question
        appdata.questionNum += 1
    }
}
