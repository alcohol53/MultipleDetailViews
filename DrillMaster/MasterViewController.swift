//
//  MasterViewController.swift
//  DrillMaster
//
//  Created by Nikolay Zhukov on 02/05/2017.
//  Copyright © 2017 Nikolay Zhukov. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {
    
    // MARK: - Model
    
    let drills = ["Drill1", "Drill2", "Drill3"]
    
    var currentIdentifier = "showDetail1"
    var replaceIdentifier: String?
    
    // MARK: - ViewController lifecicle
    
    var detailViewController: UIViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = (segue.destination as! UINavigationController).topViewController!
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drills.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let drill = drills[indexPath.row]
        configureCell(cell, withDrill: drill)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: currentIdentifier, sender: self)
    }

    func configureCell(_ cell: UITableViewCell, withDrill drill: String) {
        cell.textLabel!.text = drill
    }
    
    // MARK: - Unwind Segue
    
    @IBAction func replaceScreen(from segue: UIStoryboardSegue) {
        if let replaceIdentifier = replaceIdentifier {
            DispatchQueue.main.async() {
                self.performSegue(withIdentifier: replaceIdentifier, sender: self)
            }
        }
    }
}

