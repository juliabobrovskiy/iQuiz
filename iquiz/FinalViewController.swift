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
        if(appdata.score <= 1) {
            congratsLab.text = "Not Quite the Expert!"
        } else if(appdata.score == 2) {
            congratsLab.text = "Almost!"
        }else{
           congratsLab.text = "Youre an Expert!"
        }
        scoreLab.text = String(appdata.score) + "/3"
        appdata.score = 0
    }
    
}

