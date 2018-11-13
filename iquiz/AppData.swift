//
//  AppData.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 11/6/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import UIKit
class AppData: NSObject {
    static let shared = AppData()
    
    open var subCount = 0
    open var chosenAns = ""
    open var currentQ = ""
    open var correctIndex = 0
    open var score = 0
    open var topicIdx = 0
    
    // counts which question in the category you are in
    open var questionNum = 0
    open var selectionMade = false
    open var pathToJson = ""
    open var categories: [Category] = []
    var images : [UIImage] = [UIImage(named: "flask")!, UIImage(named: "cape")!, UIImage(named: "math")!]
    
//    var cat: [String] = ["Rap", "Kardashians", "Hunger Games"]
//    var desc: [String] = ["How well do you know rap music?", "Could you be part of the Kardashian Fam?", "Are you a true Hunger Games Fan?"]
//
//
//
//    var rapQuestions: [String] = ["What is the name of Travis Scott's latest album?", "'Humble' is to Kendrick as 'Man of the Year' is to: ___", "Who was the famous movie '8 mile' an autobiography of?"]
//
//    var karQuestions: [String] = ["What is the name of Kylie's baby?", "How many kids does Kris Jenner have?", "Who is Kim married too?"]
//    var hungQuestions: [String] = ["What is Katniss named after?", "How did Katniss and Peta meet?", "How did Rue die?"]
//
//    var rapAnswers1: Dictionary<String, [String]>() = <>
//    rapAnswers1.append("Answer", ["wooohoo rap!", "Humble", "ASTROWORLD", "Carter IV"])
//    var rapAnswers2: [String] = ["A$AP", "Schoolboy Q", "Kendrick", "Lil Pump"]
//    var rapAnswers3: [String] = ["Eminem", "Lil Xan", "Lil Wayne", "Mac Miller"]
//
//
//    var karAnswers1: [String] = ["True", "Chicago", "Stormi", "Stormie"]
//    var karAnswers2: [String] = ["10", "6", "3", "5"]
//    var karAnswers3: [String] = ["Tristan Thomsan", "Kanye West", "Scott Disick", "Ray J"]
//
//    var hungAnswers1: [String] = ["A dog", "Her district's symbol", "A flower", "Her grandmother"]
//    var hungAnswers2: [String] = ["On reaping day", "In the woods", "When he gave her bread", "At the market"]
//    var hungAnswers3: [String] = ["A spear", "Eating poison berries", "Starvation", "Hypothermia"]
//
//
//    var messageDictionary : [String: Any] = [
//        "answer": ["wooohoo rap!", "Humble", "ASTROWORLD", "Carter IV"],
//        "recipients":"system2@example.com",
//        "data": [
//            "text": "Test Message"
//        ],
//    ]
//
    //dictionary of answers
    

//    open var rightAnswers: [String] = ["ASTROWORLD", "Schoolboy Q", "Eminem", "Stormi", "6", "Kanye West", "A flower", "When he gave her bread", "A spear"]
    
}
