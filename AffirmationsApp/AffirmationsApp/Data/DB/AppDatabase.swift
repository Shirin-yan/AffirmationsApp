//
//  AppDatabase.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import GRDB

struct AppDatabase {

    private let writer: DatabaseWriter

    var reader: DatabaseReader {
        writer
    }
    
    init(_ writer: DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }
}

extension AppDatabase {
    
    // INSERT NEW CATEGORY
    func insertCategory() -> Category? {
        do {
            return try writer.write { db in
                var category = Category()
                try category.insert(db)
                category.id = db.lastInsertedRowID
                return category
            }
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    // INSERT CATEGORY TRANSLATIONS
    func insertCategoryTranslations(translations: [CategoryTranslation]) {
        do {
            try writer.write { db in
                try translations.forEach { translation in
                    let _ = try translation.inserted(db)
                }
            }
        } catch {
            debugPrint(error)
        }
    }

    // INSERT NEW AFFIRMATION
    func insertAffirmation(data: Affirmation) -> Affirmation? {
        var result = data
        do {
            return try writer.write { db in
                try result.insert(db)
                result.id = db.lastInsertedRowID
                return result
            }
        } catch {
            debugPrint(error)
            return nil
        }
    }
    
    // INSERT AFFIRMATION TRANSLATIONS
    func insertAffirmationTranslations(translations: [AffirmationTranslation]) {
        do {
            try writer.write { db in
                try translations.forEach { translation in
                    let _ = try translation.inserted(db)
                }
            }
        } catch {
            debugPrint(error)
        }
    }
    
    // GET CATEGORIES WITH THEIR TRANSLATIONS
    func getCategories() -> [CategoryWithTranslations] {
        var result = [CategoryWithTranslations]()

        do {
            try reader.read { db in
                let categories = try Category.fetchAll(db)
                try categories.forEach { category in
                    let translations = try CategoryTranslation
                        .filter(Column("categoryId") == category.id)
                        .fetchAll(db)
                    
                    result.append(CategoryWithTranslations(category: category, translations: translations))
                }
            }
        } catch {
            debugPrint(error)
        }

        return result
    }
    
    // GET AFFIRMATIONS WITH THEIR TRANSLATIONS
    func getAffirmations(categoryId: Int64) -> [AffirmationWithTranslation] {
        var result = [AffirmationWithTranslation]()

        do {
            try reader.read { db in
                let affirmations = try Affirmation.filter(Column("categoryId") == categoryId).fetchAll(db)
                try affirmations.forEach { affirmation in
                    let translations = try AffirmationTranslation
                        .filter(Column("affirmationId") == affirmation.id)
                        .fetchAll(db)
                    
                    result.append(AffirmationWithTranslation(affirmation: affirmation, translations: translations))
                }
            }
        } catch {
            debugPrint(error)
        }

        return result
    }
}
