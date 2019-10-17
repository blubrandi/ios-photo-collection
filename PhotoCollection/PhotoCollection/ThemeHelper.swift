//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    func setThemePreferenceToDark() {

        UserDefaults.standard.set(SettingsKeys.darkTheme, forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {

        UserDefaults.standard.set(SettingsKeys.blueTheme, forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}


