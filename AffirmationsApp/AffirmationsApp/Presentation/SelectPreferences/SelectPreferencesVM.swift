//
//  SelectPreferencesVM.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import Resolver

class SelectPreferencesVM: ObservableObject {
    @Injected var dbRepo: AppDatabaseRepo
    
    @Published var selectedCategory: CategoryWithTranslations?
    @Published var selectedGender = Gender.male.rawValue
    @Published var selectedBg = Bg.blue.rawValue
    
    var categories: [CategoryWithTranslations] = []
    var gender = Gender.allCases

    init(){
        let mockData = MockDataHelper()
        mockData.seedDatabase()
        Defaults.dataSetup = true

        categories = dbRepo.getCategories()
        selectedCategory = categories.first
    }
    
    func saveData(){
        Defaults.category = Int(selectedCategory?.category.id ?? 0)
        Defaults.gender = selectedGender
        Defaults.bgColor = selectedBg
    }
}
