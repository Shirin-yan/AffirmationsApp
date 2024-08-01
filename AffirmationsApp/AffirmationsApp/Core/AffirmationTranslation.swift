//
//  AffirmationTranslation.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import GRDB

struct AffirmationTranslation: Codable {
    var id: Int64?
    var affirmationId: Int64
    var langCode: String
    var text: String
}

extension AffirmationTranslation: FetchableRecord, MutablePersistableRecord {
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}
