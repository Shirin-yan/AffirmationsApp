//
//  Persistance.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import GRDB

extension AppDatabase {
    
    static let shared = makeShared()

    static func makeShared() -> AppDatabase {
        do {
            let fileManager = FileManager()
            let folder = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("database", isDirectory: true)
            try fileManager.createDirectory(at: folder, withIntermediateDirectories: true)

            let databaseUrl = folder.appendingPathComponent("db.sqlite")
            let writer = try DatabasePool(path: databaseUrl.path)
            let database = try AppDatabase(writer)

            return database
        } catch {
            fatalError("ERROR: \(error)")
        }
    }
}
