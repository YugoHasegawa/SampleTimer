//
//  SettingEditor.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/12/01.
//

import SwiftUI

struct TimerTypeOption {
    var icon: String
    var category: String
}

struct SettingEditor: View {
    @Binding var setting: TimerSetting
    @State var player: SoundPlayer?
    
    let timerTypes: [TimerTypeOption] = [
        .init(icon: "clock", category: "General"),
        .init(icon: "figure.run", category: "Training"),
    ]
    
    var body: some View {
        Form {
            HStack {
                Menu {
                    Picker("icon", selection: $setting.icon) {
                        ForEach(timerTypes, id: \.self.icon) { option in
                            HStack {
                                Image(systemName: option.icon)
                                Spacer()
                                Text(option.category)
                            }.tag(option.icon)
                        }
                    }
                } label: {
                    Image(systemName: setting.icon)
                }
                Spacer()
                TextField("Name", text: $setting.name)
                Spacer()
                Menu {
                    Picker("", selection: $setting.background) {
                        ForEach(TimerColor.allCases) { bg in
                            Label(bg.rawValue, systemImage: "circle.fill")
                                .tint(bg.color)
                                .tag(bg)
                        }
                    }
                    .pickerStyle(.palette)
                } label: {
                    Rectangle()
                        .foregroundColor(setting.background.color)
                        .cornerRadius(10)
                        .frame(width: 20, height: 20)
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.yellow)
                    Menu {
                        Picker("", selection: $setting.sound) {
                            ForEach(TimerSound.allCases) { sound in
                                Text(sound.rawValue).tag(sound.fileName)
                            }
                        }
                        .onChange(of: setting.sound) {
                            player = SoundPlayer(name: setting.sound.fileName, duration: setting.sound.duration)
                            player?.play()
                        }
                    } label: {
                        Text(setting.sound.rawValue)
                    }
                }
                HStack {
                    Spacer()
                    Text("使用した音素材：OtoLogic(https://otologic.jp)").font(.footnote)
                }
            }
            DurationField(duration: $setting.time)
        }
    }
}

#Preview {
    SettingEditor(setting: .constant(.init(icon: "clock", name: "test", time: .init(3661), background: .orange, sound: .yattaze)))
}
