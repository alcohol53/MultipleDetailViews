//
//  ViewController3.swift
//  DrillMaster
//
//  Created by Nikolay Zhukov on 05/05/2017.
//  Copyright © 2017 Nikolay Zhukov. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UIPopoverPresentationControllerDelegate, Screenable {
    
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
        
        print("ViewController3")
    }
}
