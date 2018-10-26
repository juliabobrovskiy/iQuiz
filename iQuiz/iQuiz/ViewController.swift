//
//  ViewController.swift
//  iquiz
//
//  Created by Julia Bobrovskiy on 10/25/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let categories = ["Rap Artists", "Wine Tasting", "Harry Potter"]
    let desc = ["Find out which famous rapper you are!", "What your wine taste says about you.", "Who is your spirit wizard?"]
    let images : [UIImage] = [UIImage(named: "microphone")!, UIImage(named: "wine")!, UIImage(named: "wand3")!]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(categories.count)
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
        cell.textLabel?.text = categories[indexPath.row]
        cell.detailTextLabel?.text = desc[indexPath.row]
        cell.imageView?.image = images[indexPath.row]
        return (cell)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

