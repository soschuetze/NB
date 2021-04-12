//
//  LandscapeManager.swift
//  NB
//
//  Created by Sinclaire Schuetze on 4/11/21.
//  Copyright © 2021 Necessary Behavior. All rights reserved.
//

import Foundation

class LandscapeManager {
    
    static let shared = LandscapeManager()
    var isFirstLaunch: Bool{
        get {
            !UserDefaults.standard.bool(forKey: #function)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
    
    
}
