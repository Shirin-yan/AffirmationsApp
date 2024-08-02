//
//  CategoryWithTranslation.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation

struct CategoryWithTranslations: Codable, Identifiable {
    var id: UUID = UUID()
    var category: Category
    var translations: [CategoryTranslation]
    
    func getCategoryName(lang: String = Locale.current.languageCode ?? "ru") -> String {
        return translations.first(where: {$0.langCode == lang })?.name ?? translations.first?.name ?? ""
    }
}
