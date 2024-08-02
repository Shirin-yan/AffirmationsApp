//
//  AppDatabaseRepo.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation


protocol AppDatabaseRepoProtocol {
    func getCategories() -> [CategoryWithTranslations]
    func getAffirmations(categoryId: Int64?) -> [AffirmationWithTranslation]
}

struct AppDatabaseRepo: AppDatabaseRepoProtocol {
    
    func getCategories() -> [CategoryWithTranslations] {
        return AppDatabase.shared.getCategories()
    }
    
    func getAffirmations(categoryId: Int64? = Int64(Defaults.category)) -> [AffirmationWithTranslation] {
        guard let categoryId = categoryId else { return [] }
        return AppDatabase.shared.getAffirmations(categoryId: categoryId)
    }
}

