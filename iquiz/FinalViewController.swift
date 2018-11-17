//
//  FinalViewController.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 11/6/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//


import Foundation
import UIKit

class FinalViewController: UIViewController {
    var appdata = AppData.shared
    
    @IBOutlet weak var congratsLab: UILabel!
    @IBOutlet weak var scoreLab: UILabel!
    
    // Displays the final score as well as how the
    // user did on the quiz
    override func viewDidLoad() {
        super.viewDidLoad()
        let totalPossible = appdata.categories[appdata.topicIdx].allQuestionData.count
        let yourPercent = Double(appdata.score) / Double(totalPossible)
        print(yourPercent)
        if(yourPercent <= 0.2) {
            congratsLab.text = "Not Quite the Expert!"
        } else if(yourPercent <= 0.8 && yourPercent > 0.2) {
            congratsLab.text = "Almost!"
        }else{
           congratsLab.text = "Youre an Expert!"
        }
        scoreLab.text = String(appdata.score) + "/" + String(totalPossible)
        
        appdata.score = 0
    }
}

