//
//  UserDefaults_Extensions.swift
//  Food_Ordering
//
//  Created by Huy Binh on 21/08/2022.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultKeys : String {
        case isHome
    }
    
    var isHome: Bool {
        get{
            bool(forKey: UserDefaultKeys.isHome.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultKeys.isHome.rawValue)
        }
    }
}
