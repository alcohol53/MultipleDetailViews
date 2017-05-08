//
//  RoutingViewController.swift
//  DrillMaster
//
//  Created by Nikolay Zhukov on 04/05/2017.
//  Copyright © 2017 Nikolay Zhukov. All rights reserved.
//

import UIKit

class RoutingViewController: UITableViewController {
    
    private enum ScreenType : String {
        case Screen1 = "Screen 1"
        case Screen2 = "Screen 2"
        case Screen3 = "Screen 3"
        
        static let allValues = [Screen1, Screen2, Screen3]
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScreenType.allValues.count
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Remove "Cancel" button for popover presentation.
        if let popoverPresentationController = navigationController?.popoverPresentationController {
            if popoverPresentationController.arrowDirection != .unknown {
                navigationItem.leftBarButtonItem = nil
            }
        }
        
        // Minimize popover presetnation
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Screen Type", for: indexPath)
        cell.textLabel!.text = ScreenType.allValues[indexPath.row].rawValue

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mvc = segue.destination as? MasterViewController
        
        switch ScreenType.allValues[(tableView.indexPathForSelectedRow?.row)!] {
            case .Screen1:
                mvc?.currentIdentifier = "showDetail1"
                mvc?.replaceIdentifier = "replaceDetail1"
            case .Screen2:
                mvc?.currentIdentifier = "showDetail2"
                mvc?.replaceIdentifier = "replaceDetail2"
            case .Screen3:
                mvc?.currentIdentifier = "showDetail3"
                mvc?.replaceIdentifier = "replaceDetail3"
        }
    }
}
