//
//  AffirmationWithTranslation.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation

struct AffirmationWithTranslation {
    var affirmation: Affirmation
    var translations: [AffirmationTranslation]

    func getAffirmationText(lang: String = Defaults.lang) -> String {
        return translations.first(where: {$0.langCode == lang })?.text ?? ""
    }
}

