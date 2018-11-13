//
//  Question.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 11/11/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import Foundation
import UIKit

class Question: NSObject{
    
    var question: String
    var answerIndex: Int
    var answers: [String]
    
    // Sets attributes of a question
    init(allQuestionData: Dictionary<String, Any>) {
        question = allQuestionData["text"] as! String
        let num = allQuestionData["answer"] as! String
        answerIndex = Int(num as String)!
        answers = allQuestionData["answers"] as! [String]
    }
}
