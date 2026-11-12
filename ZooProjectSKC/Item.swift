//
//  Item.swift
//  ZooProjectSKC
//
//  Created by Dana Emile de Castro da Costa on 12/11/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
