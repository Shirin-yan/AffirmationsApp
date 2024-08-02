//
//  Category.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import Foundation
import GRDB

struct Category: Codable {
    var id: Int64?
}

extension Category: FetchableRecord, MutablePersistableRecord {
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}
