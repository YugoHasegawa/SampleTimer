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

enum TimerSound: String, CaseIterable, Codable, Identifiable {
    case birdland = "バードランド"
    case cyber = "サイバー"
    case kidouontekina = "起動音的な"
    case mei_kara_mei_switch = "明から明スイッチ"
    case menso_re = "めんそーれ"
    case party_kaimaku = "パーティー開幕"
    case pastel_color = "パステルカラー"
    case syanikamaeru = "斜に構える"
    case tumazuku_kanzi = "つまずく感じ"
    case warning = "警告"
    case yattaze = "やったぜ"
    
    var fileName: String {
        switch self {
        case .birdland:
            return "birdland"
        case .cyber:
            return "cyber"
        case .kidouontekina:
            return "kidouontekina"
        case .mei_kara_mei_switch:
            return "mei kara mei switch"
        case .menso_re:
            return "menso-re"
        case .party_kaimaku:
            return "party kaimaku"
        case .pastel_color:
            return "pastel color"
        case .syanikamaeru:
            return "syanikamaeru"
        case .tumazuku_kanzi:
            return "tumazuku kanzi"
        case .warning:
            return "warning"
        case .yattaze:
            return "yattaze!"
        }
    }
    
    var duration: TimeInterval {
        switch self {
            
        case .birdland:
            return 5
        case .cyber:
            return 5
        case .kidouontekina:
            return 5
        case .mei_kara_mei_switch:
            return 5
        case .menso_re:
            return 5
        case .party_kaimaku:
            return 8
        case .pastel_color:
            return 5
        case .syanikamaeru:
            return 7
        case .tumazuku_kanzi:
            return 5
        case .warning:
            return 5
        case .yattaze:
            return 5
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
    var sound: TimerSound
    var createdAt: Date
    var lastExecutedAt: Date?
    
    init(icon: String, name: String, time: TimeInterval, background: TimerColor, sound: TimerSound) {
        self.id = UUID()
        self.icon = icon
        self.name = name
        self.time = time
        self.background = background
        self.sound = sound
        self.createdAt = Date()
    }
}
