//
//  AffirmationsApp.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 31.07.2024.
//

import SwiftUI

@main
struct AffirmationsApp: App {
    @AppStorage(DefaultsKey.onboardingShown.rawValue) var onboardingShown = Defaults.dataSetup
    
    var body: some Scene {
        WindowGroup {
            if onboardingShown {
                MainView()
            } else {
                SelectPreferencesView()
            }
        }
    }
}
