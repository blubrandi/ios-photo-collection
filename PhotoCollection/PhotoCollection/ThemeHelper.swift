//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Color", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return themePreferenceKey
    }
}


