//
//  Defaults.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation

enum DefaultsKey: String {
    case dataSetup
    case onboardingShown
    case category
    case bgColor
    case gender
}

class Defaults {
    static var dataSetup: Bool {
        get { UserDefaults.standard.bool(forKey: DefaultsKey.dataSetup.rawValue) }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.dataSetup.rawValue)}
    }
    
    static var onboardingShown: Bool {
        get { UserDefaults.standard.bool(forKey: DefaultsKey.onboardingShown.rawValue) }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.onboardingShown.rawValue)}
    }
    
    static var category: Int {
        get { Int(UserDefaults.standard.string(forKey: DefaultsKey.category.rawValue) ?? "1") ?? 1 }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.category.rawValue)}
    }
    
    static var bgColor: String {
        get { UserDefaults.standard.string(forKey: DefaultsKey.bgColor.rawValue) ?? Bg.blue.rawValue }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.bgColor.rawValue)}
    }
    
    static var gender: String {
        get { UserDefaults.standard.string(forKey: DefaultsKey.gender.rawValue) ?? Gender.male.rawValue }
        set { UserDefaults.standard.setValue(newValue, forKey: DefaultsKey.gender.rawValue)}
    }
}
