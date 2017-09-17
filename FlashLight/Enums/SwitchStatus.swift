//
//  SwitchStatus.swift
//  FlashLight
//
//  Created by Mihai Ruber on 9/16/17.
//  Copyright © 2017 Mihai Ruber. All rights reserved.
//

import Foundation
import UIKit

enum SwitchStatus: Togglable {
    case on, off
    
    mutating func toggle() {
        //self refers to whatever instance of switchstatus we use
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
    
}
