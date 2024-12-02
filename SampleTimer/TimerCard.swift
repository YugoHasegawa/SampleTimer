//
//  TimerCard.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/12/01.
//

import SwiftUI

struct TimerCard: View {
    @State var setting: TimerSetting
    
    var body: some View {
        HStack {
            NavigationLink(destination: ExecutionTimer(setting: $setting)) {
                HStack {
                    Image(systemName: setting.icon)
                    Text(setting.name)
                }
            }
            Spacer()
            NavigationLink(destination: SettingEditor(setting: $setting)) {
                Image(systemName: "ellipsis.circle.fill")
            }
        }
        .padding()
        .foregroundColor(.black)
        .background() {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(setting.background.color)
        }
    }
}

#Preview {
    TimerCard(setting: .init(icon: "clock", name: "Sample Timer", time: .init(100), background: .orange))
}
