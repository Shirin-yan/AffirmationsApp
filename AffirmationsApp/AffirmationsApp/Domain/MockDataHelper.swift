//
//  MockDataHelper.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation

class MockDataHelper {
    
    init(){
        seedDatabas()
    }
    
    func seedDatabas(){
        if Defaults.onboardingShown { return }
        guard let loveCategory = AppDatabase.shared.insertCategory() else { return }
        AppDatabase.shared.insertCategoryTranslations(translations: [
            CategoryTranslation(categoryId: loveCategory.id!, langCode: "en", name: "Love"),
            CategoryTranslation(categoryId: loveCategory.id!, langCode: "ru", name: "Любовь")
        ])
        
        for i in 0..<10 {
            guard let aff = AppDatabase.shared.insertAffirmation(data: Affirmation(categoryId: loveCategory.id!, isFavorited: false)) else { return }
            AppDatabase.shared.insertAffirmationTranslations(translations: [
                AffirmationTranslation(affirmationId: aff.id!, langCode: "en", text: loveEnAffirmations[i]),
                AffirmationTranslation(affirmationId: aff.id!, langCode: "ru", text: loveRuAffirmations[i]),
            ])
        }
        
        guard let friendshipCategory = AppDatabase.shared.insertCategory() else { return }
        AppDatabase.shared.insertCategoryTranslations(translations: [
            CategoryTranslation(categoryId: friendshipCategory.id!, langCode: "en", name: "Friendship"),
            CategoryTranslation(categoryId: friendshipCategory.id!, langCode: "ru", name: "Дружба")
        ])
        
        for i in 0..<10 {
            guard let aff = AppDatabase.shared.insertAffirmation(data: Affirmation(categoryId: friendshipCategory.id!, isFavorited: false)) else { return }
            AppDatabase.shared.insertAffirmationTranslations(translations: [
                AffirmationTranslation(affirmationId: aff.id!, langCode: "en", text: friendshipEnAffirmations[i]),
                AffirmationTranslation(affirmationId: aff.id!, langCode: "ru", text: friendshipRuAffirmations[i]),
            ])
        }
    }
}

fileprivate let loveEnAffirmations = ["I am worthy of love and deserve to receive love in abundance",
                          "My heart is open to giving and receiving love",
                          "I am surrounded by love every day and in every way",
                          "I attract love and loving relationships into my life",
                          "Love flows to me and through me effortlessly",
                          "I radiate love and others reflect love back to me",
                          "My relationships are filled with love, happiness, and respect",
                          "I am grateful for the love that surrounds me",
                          "Love comes to me easily and effortlessly",
                          "I am a magnet for loving and fulfilling relationships"]

fileprivate let loveRuAffirmations = ["Я достоин любви и заслуживаю получать любовь в изобилии",
                                 "Мое сердце открыто для дарения и получения любви",
                                 "Я окружен любовью каждый день и во всех отношениях",
                                 "Я привлекаю любовь и любящие отношения в свою жизнь",
                                 "Любовь течет ко мне и через меня без усилий",
                                 "Я излучаю любовь, и другие отражают любовь мне в ответ",
                                 "Мои отношения наполнены любовью, счастьем и уважением",
                                 "Я благодарен за любовь, которая меня окружает",
                                 "Любовь приходит ко мне легко и без усилий",
                                 "Я магнит для любящих и полноценных отношений"]

fileprivate let friendshipEnAffirmations = ["I am surrounded by supportive and loving friends",
                                            "I attract positive and loyal friendships into my life",
                                            "My friends and I share mutual respect and trust",
                                            "I am a kind and caring friend, and I receive the same in return",
                                            "My friendships are filled with joy, laughter, and understanding",
                                            "I am grateful for the amazing friends in my life",
                                            "I nurture and cherish my friendships",
                                            "I attract friends who support and uplift me",
                                            "My friends and I grow together in love and harmony",
                                            "I am a magnet for genuine and lasting friendships"]

fileprivate let friendshipRuAffirmations = ["Меня окружают поддерживающие и любящие друзья",
                                      "Я привлекаю в свою жизнь позитивную и преданную дружбу",
                                      "Мы с друзьями разделяем взаимное уважение и доверие",
                                      "Я добрый и заботливый друг, и я получаю то же самое в ответ",
                                      "Моя дружба наполнена радостью, смехом и пониманием",
                                      "Я благодарен за удивительных друзей в моей жизни",
                                      "Я лелею и дорожу своей дружбой",
                                      "Я привлекаю друзей, которые поддерживают и воодушевляют меня",
                                      "Мы с друзьями растем вместе в любви и гармонии",
                                      "Я магнит для настоящей и прочной дружбы"]
