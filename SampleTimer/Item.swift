//
//  Item.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/11/30.
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
