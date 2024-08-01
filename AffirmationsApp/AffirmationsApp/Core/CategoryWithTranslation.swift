//
//  CategoryWithTranslation.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation

struct CategoryWithTranslations: Codable {
    var category: Category
    var translations: [CategoryTranslation]
    
    func getCategoryName(lang: String = Defaults.lang) -> String {
        return translations.first(where: {$0.langCode == lang })?.name ?? ""
    }
}
