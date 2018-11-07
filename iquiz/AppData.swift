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
    
    open var categories: [String] = ["Rap", "Kardashians", "Hunger Games"]
    open var desc: [String] = ["How well do you know rap music?", "Could you be part of the Kardashian Fam?", "Are you a true Hunger Games Fan?"]
    
    open var images : [UIImage] = [UIImage(named: "microphone")!, UIImage(named: "wine")!, UIImage(named: "wand3")!]
    
    open var topicIdx = 0
    
    open var rapQuestions: [String] = ["What is the name of Travis Scott's latest album?", "'Humble' is to Kendrick as 'Man of the Year' is to: ___", "Who was the famous movie '8 mile' an autobiography of?"]
    
    open var karQuestions: [String] = ["What is the name of Kylie's baby?", "How many kids does Kris Jenner have?", "Who is Kim married too?"]
    open var hungQuestions: [String] = ["What is Katniss named after?", "How did Katniss and Peta meet?", "How did Rue die?"]
    
    open var rapAnswers1: [String] = ["wooohoo rap!", "Humble", "ASTROWORLD", "Carter IV"]
    open var rapAnswers2: [String] = ["A$AP", "Schoolboy Q", "Kendrick", "Lil Pump"]
    open var rapAnswers3: [String] = ["Eminem", "Lil Xan", "Lil Wayne", "Mac Miller"]
    //open var allRapAnswers: [[String]] = []
    
    
    open var karAnswers1: [String] = ["True", "Chicago", "Stormi", "Stormie"]
    open var karAnswers2: [String] = ["10", "6", "3", "5"]
    open var karAnswers3: [String] = ["Tristan Thomsan", "Kanye West", "Scott Disick", "Ray J"]
    
    open var hungAnswers1: [String] = ["A dog", "Her district's symbol", "A flower", "Her grandmother"]
    open var hungAnswers2: [String] = ["On reaping day", "In the woods", "When he gave her bread", "At the market"]
    open var hungAnswers3: [String] = ["A spear", "Eating poison berries", "Starvation", "Hypothermia"]
    
    open var rightAnswers: [String] = ["ASTROWORLD", "Schoolboy Q", "Eminem", "Stormi", "6", "Kanye West", "A flower", "When he gave her bread", "A spear"]
    
}
