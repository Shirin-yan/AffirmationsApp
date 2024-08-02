//
//  MainVM.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 02.08.2024.
//

import Foundation
import Resolver

class MainVM: ObservableObject {
    @Injected var dbRepo: AppDatabaseRepo
    
    @Published var affirmations: [AffirmationWithTranslation] = []
    @Published var categories: [CategoryWithTranslations] = []
    
    init(){
        setupData()
    }
    
    func setupData(){
        affirmations = dbRepo.getAffirmations()
        categories = dbRepo.getCategories()
    }
}
