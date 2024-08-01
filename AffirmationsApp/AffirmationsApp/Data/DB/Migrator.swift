//
//  Migrator.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import GRDB

extension AppDatabase {
    
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()

        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif

        migrator.registerMigration("v1") { db in
            try createCategoryAndAffirmationTables(db)
        }

        return migrator

    }

    private func createCategoryAndAffirmationTables(_ db: GRDB.Database) throws {
        try db.create(table: "category") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("text", .text).notNull()
        }

        try db.create(table: "categoryTranslation") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("categoryId", .integer).notNull().references("category", onDelete: .cascade)
            table.column("langCode", .text).notNull()
            table.column("name", .text).notNull()
        }

        try db.create(table: "affirmation") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("categoryId", .integer).notNull().references("category", onDelete: .cascade)
            table.column("isFavorited", .boolean).notNull()
        }
        
        try db.create(table: "affirmationTranslation") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("affirmationId", .integer).notNull().references("affirmation", onDelete: .cascade)
            table.column("langCode", .text).notNull()
            table.column("text", .text).notNull()
        }
    }
}
