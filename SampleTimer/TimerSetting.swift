//
//  TimerSetting.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/11/30.
//

import Foundation
import SwiftUI
import SwiftData

enum TimerColor: String, CaseIterable, Codable, Identifiable {
    case red = "red"
    case blue = "blue"
    case green = "green"
    case yellow = "yellow"
    case orange = "orange"
    
    var color: Color {
        switch self {
        case .red:
            return Color.red.opacity(0.5)
        case .blue:
            return Color.blue.opacity(0.5)
        case .green:
            return Color.green.opacity(0.5)
        case .yellow:
            return Color.yellow.opacity(0.5)
        case .orange:
            return Color.orange.opacity(0.5)
        }
    }
    
    var id: Self { self }
}

@Model
final class TimerSetting {
    var id: UUID
    var icon: String
    var name: String
    var time: TimeInterval
    var background: TimerColor
    var createdAt: Date
    var lastExecutedAt: Date?
    
    init(icon: String, name: String, time: TimeInterval, background: TimerColor) {
        self.id = UUID()
        self.icon = icon
        self.name = name
        self.time = time
        self.background = background
        self.createdAt = Date()
    }
}
