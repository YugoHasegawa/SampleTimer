//
//  File.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/12/01.
//

import SwiftUI

private func splitDuration(d: TimeInterval) -> [Int] {
    return [Int(d / 3600), Int((d.truncatingRemainder(dividingBy: 3600)) / 60), Int(d.truncatingRemainder(dividingBy: 60))]
}

private func mergeDuration(hours: Int, minutes: Int, seconds: Int) -> TimeInterval {
    return TimeInterval(3600 * hours + 60 * minutes + seconds)
}


struct DurationField: View {
    @Binding var duration: TimeInterval
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
        formatter.maximumIntegerDigits = 2
        formatter.minimum = 0
        formatter.maximum = 59
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                // 時間
                TextField("00", value: $hours, formatter: formatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                
                Text(":")
                
                // 分
                TextField("00", value: $minutes, formatter: formatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                
                Text(":")
                
                // 秒
                TextField("00", value: $seconds, formatter: formatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
            }
        }
        .padding()
        .onChange(of: [hours, minutes, seconds]) {
            self.duration = mergeDuration(hours: hours, minutes: minutes, seconds: seconds)
        }
        .onAppear() {
            let splitDuration = splitDuration(d: duration)
            self.hours = splitDuration[0]
            self.minutes = splitDuration[1]
            self.seconds = splitDuration[2]
        }
    }
}

#Preview {
    DurationField(duration: .constant(0))
}
