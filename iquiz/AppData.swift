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
    
    // Stored JSON data (used when there is no wifi)
    open var data : Data? = nil
    
    // counts which question in the category you are in
    open var questionNum = 0
    open var selectionMade = false
    open var pathToJson = ""
    open var categories: [Category] = []
    var images : [UIImage] = [UIImage(named: "flask")!, UIImage(named: "cape")!, UIImage(named: "math")!]
    
    open var background_setting = UserDefaults.standard.bool(forKey: "change_back_settings")
    open var scoreCollection = Dictionary<String, [Int]>()
    
  

    
}
