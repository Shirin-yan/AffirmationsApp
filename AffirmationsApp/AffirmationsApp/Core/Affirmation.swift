//
//  Affirmation.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import GRDB

struct Affirmation: Codable {
    var id: Int64?
    var categoryId: Int64
    var isFavorited: Bool
}

extension Affirmation: FetchableRecord, MutablePersistableRecord {
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}
