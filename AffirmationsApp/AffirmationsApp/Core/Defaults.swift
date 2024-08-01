//
//  Defaults.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation

enum DefaultsKey: String {
    case onboardingShown
    case category
    case bgColor
    case gender
    case lang
}

class Defaults {
    static var onboardingShown: Bool {
        get { UserDefaults.standard.bool(forKey: DefaultsKey.onboardingShown.rawValue) }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.onboardingShown.rawValue)}
    }
    
    static var category: String {
        get { UserDefaults.standard.string(forKey: DefaultsKey.category.rawValue) ?? "" }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.category.rawValue)}
    }
    
    static var bgColor: String {
        get { UserDefaults.standard.string(forKey: DefaultsKey.bgColor.rawValue) ?? "" }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.bgColor.rawValue)}
    }
    
    static var gender: String {
        get { UserDefaults.standard.string(forKey: DefaultsKey.gender.rawValue) ?? "" }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.gender.rawValue)}
    }
    
    static var lang: String {
        get { UserDefaults.standard.string(forKey: DefaultsKey.lang.rawValue) ?? "" }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.lang.rawValue)}
    }
}
