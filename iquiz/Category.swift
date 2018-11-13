//
//  Category.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 11/11/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import Foundation
import UIKit

class Category: NSObject{
    
    var title: String
    var desc: String
    var allQuestionData: [Question] = []
    
    init(quizData: Dictionary<String, Any>) {
        
        // set the title and description
        title = quizData["title"] as! String
        desc = quizData["desc"] as! String
        let questionData = quizData["questions"] as! [Dictionary<String, Any>]
        
        // iterate through all of the questions and their data, and creat
        // question objects
        for questionDict in questionData {
            let questionInfo = Question(allQuestionData: questionDict)
            allQuestionData.append(questionInfo)
        }
    }
}
