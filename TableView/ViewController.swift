//
//  ViewController.swift
//  TableView
//
//  Created by MAN WAI HO on 25/10/2019.
//  Copyright © 2019 MAN WAI HO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var UITableView: UITableView!
    
    let animals:[String] = ["Alligator", "Bat", "Bear", "Bird", "Camel", "Cat", "Deer", "Dog", "Eagle", "Fish", "Goat", "Jaguar", "Kangaroo", "Leopard", "Octopus", "Panda", "Pig", "Rabbit", "Shark", "Tiger", "Whale", "Zebra"]

    @IBAction func refreshButton(_ sender: Any) {
        UITableView.reloadData()
        animateTable()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel?.text = animals[indexPath.row]
        return cell
    }

    // tableView with slide in Animation
    func animateTable() {
        UITableView.reloadData()
        let cells = UITableView.visibleCells
        let tableViewWidth = UITableView.bounds.size.width
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: tableViewWidth, y: 0)
        }
        
        var delayCounter: Double = 0
        for cell in cells {
            UIView.animate(withDuration: 0.5, delay: delayCounter * 0.5, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 0.01
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



