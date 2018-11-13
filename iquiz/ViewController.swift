//
//  ViewController.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 10/25/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var appdata = AppData.shared
    var jsonTextField: UITextField?
    @IBOutlet weak var tblView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.topicIdx = indexPath.row
        appdata.score = 0
        appdata.questionNum = 0
        performSegue(withIdentifier: "goToQuestion", sender: self)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appdata.categories.count
    }
    
    
    // When user clicks settings they can enter new path to JSON file
    @IBAction func settingsPush(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Input JSON URL", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: jsonTextField)
        let checkNowAction = UIAlertAction(title: "Check Now", style: .default, handler : self.checkHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style : .cancel, handler : nil)
        alert.addAction(checkNowAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func jsonTextField(textField: UITextField!) {
        jsonTextField = textField
        jsonTextField?.placeholder = "http://example/url.json"
        
    }
    
    func checkHandler(alert: UIAlertAction!) {
        appdata.categories = []
        appdata.pathToJson = jsonTextField!.text!
        getJsonData(url: jsonTextField!.text!)
        tblView.reloadData()
    }
 
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = appdata.categories[indexPath.row].title
        cell.detailTextLabel?.text = appdata.categories[indexPath.row].desc
        cell.imageView?.image = appdata.images[indexPath.row]
        return (cell)
    }
    
    // Function accepts a pathway to a json file and then stores it in data
    func getJsonData(url: String) {
        var data : Data? = nil
        
        do {
            // Getting data from json URL when there is connection
            data = try Data(contentsOf: URL(string: url)!, options: .mappedIfSafe)
            do {
                // Writing the data to a file
                try data!.write(to: URL(fileURLWithPath: "/tmp/jsonData.txt"))
            } catch {
                print(error)
            }
        } catch {
            // There is no wifi
            let alert = UIAlertController(title: "Error", message: "Failed to Download", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            do {
                // Retrieve data from file path that already exists
                data = try Data(contentsOf: URL(fileURLWithPath: "/tmp/jsonData.txt"), options: .mappedIfSafe)
            } catch {
                let alert = UIAlertController(title: "Error", message: "No Wifi", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        do {
            if let data = data {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [Dictionary<String, AnyObject>] {
                    for categoryDict in jsonResult {
                        let category =  Category(quizData: categoryDict)
                        appdata.categories.append(category)
                    }
                }
            }
        } catch {
            print(error)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        appdata.categories = []
        
        // default app data
        if(appdata.pathToJson.isEmpty){
            //appdata.pathToJson = "file:///Users/juliabobrovskiy/Downloads/paps.json"
            appdata.pathToJson = "http://tednewardsandbox.site44.com/questions.json"
        }
        getJsonData(url: appdata.pathToJson)
        tblView.dataSource = self
        tblView.delegate = self
        appdata.subCount = 0

    }

}
