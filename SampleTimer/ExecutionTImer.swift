//
//  ExecutionTImer.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/12/01.
//

import SwiftUI

public struct ExecutionTimer: View {
    @Binding var setting: TimerSetting
    @State var remainingTime: TimeInterval
    @State var isEnd: Bool = false
    
    init(setting: Binding<TimerSetting>) {
        self._setting = setting
        self.remainingTime = setting.wrappedValue.time
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack {
                Image(systemName: setting.icon)
                Text(setting.name)
            }
                .font(.title)
            Text(isEnd ? "終了" : timeString(from: remainingTime))
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(setting.background.color.ignoresSafeArea())
        .onAppear(perform: startCountdown)
    }
    
    private func timeString(from time: TimeInterval) -> String {
        let hour = Int(time / 3600)
        let minute = Int((time.truncatingRemainder(dividingBy: 3600)) / 60)
        let second = Int(time.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    private func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                timer.invalidate()
                isEnd = true
                self.setting.lastExecutedAt = Date()
            }
        }
    }
}

#Preview {
    ExecutionTimer(setting: .constant(.init(icon: "figure.run", name: "運動", time: .init(3), background: .blue)))
}
