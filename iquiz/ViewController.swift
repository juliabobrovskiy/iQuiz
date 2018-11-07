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
    @IBOutlet weak var tblView: UITableView!
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.topicIdx = indexPath.row
        appdata.score = 0
        performSegue(withIdentifier: "goToQuestion", sender: self)
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appdata.categories.count
    }
    
    // Performs Alert
    @IBAction func settingsPush(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: "Check back for settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)

        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = appdata.categories[indexPath.row]
        cell.detailTextLabel?.text = appdata.desc[indexPath.row]
        cell.imageView?.image = appdata.images[indexPath.row]
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        appdata.subCount = 0
    }

}

