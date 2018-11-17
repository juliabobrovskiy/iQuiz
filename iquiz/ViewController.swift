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
    var refresh: UIRefreshControl!
    var wifiError = NSURLConnection()
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
        appdata.scoreCollection[appdata.categories[indexPath.row].title] = []
        // adds category to score collector
        
        // Changes sell color based off of user settings.
        if (appdata.background_setting == true) {
            cell.backgroundColor = UIColor.black
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.black
            
        }
        return (cell)
    }
    
    
     //Function accepts a pathway to a json file and then stores it in data
    func getJsonData(url: String) {

        do {
            // Getting data from json URL when there is connection
            appdata.data = try Data(contentsOf: URL(string: url)!, options: .mappedIfSafe)
            
        } catch let Error as NSError where Error.code == NSURLErrorNotConnectedToInternet {
            let alert = UIAlertController(title: "Error", message: "No Wifi", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } catch {
            let alert = UIAlertController(title: "Error", message: "Couldn't Load Quiz", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        do {
            if let data = appdata.data {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [Dictionary<String, AnyObject>] {
                    for categoryDict in jsonResult {
                        let category =  Category(quizData: categoryDict)
                        appdata.categories.append(category)
                    }
                } else {
                    // Alert user that the Json data they submitted was not the correct format
                    let alert = UIAlertController(title: "Error", message: "JSON not recieved in correct format", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } catch {
            print(error)
        }

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.register(defaults: [String : Any]())
        // changes background color depending on user settings
        if (appdata.background_setting == true) {
            tblView.backgroundColor = UIColor.black
        } else {
            tblView.backgroundColor = UIColor.white
        }
        
        // Refresh statements
        refresh = UIRefreshControl()
        tblView.addSubview(refresh)
        refresh.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refresh.tintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        refresh.addTarget(self, action: #selector(activateRefresh), for: .valueChanged)
        

        appdata.categories = []
        
        // default app data
        if(appdata.pathToJson.isEmpty){
            appdata.pathToJson = "http://tednewardsandbox.site44.com/questions.json"
        }
        getJsonData(url: appdata.pathToJson)
        tblView.dataSource = self
        tblView.delegate = self
        appdata.subCount = 0

    }

    @objc func activateRefresh() {
        tblView.reloadData()
        refresh.endRefreshing()
    }

}
