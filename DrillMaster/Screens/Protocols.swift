//
//  Protocols.swift
//  DrillMaster
//
//  Created by Nikolay Zhukov on 07/05/2017.
//  Copyright © 2017 Nikolay Zhukov. All rights reserved.
//

import Foundation

protocol Screenable {
    var model: AnyObject? { get set }
    func updateModel()
}

extension Screenable {
}
