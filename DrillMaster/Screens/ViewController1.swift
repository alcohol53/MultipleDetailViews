//
//  ViewController1.swift
//  DrillMaster
//
//  Created by Nikolay Zhukov on 04/05/2017.
//  Copyright © 2017 Nikolay Zhukov. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, UIPopoverPresentationControllerDelegate, Screenable {
    
    // MARK: - Model
    
    var model: AnyObject? {
        didSet {
            updateModel()
        }
    }
    
    func updateModel() {
    }
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateModel()
        
        print("ViewController1")
    }
}
