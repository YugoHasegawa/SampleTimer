//
//  ContentView.swift
//  SampleTimer
//
//  Created by 長谷川 雄吾 on 2024/11/30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\TimerSetting.lastExecutedAt, order: .reverse), SortDescriptor(\TimerSetting.createdAt, order: .forward)])
    private var settings: [TimerSetting]

    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(settings) { setting in
                        TimerCard(setting: setting)
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = TimerSetting(icon: "clock", name: "新しいタイマー", time: .init(10), background: .red, sound: .birdland)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(settings[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TimerSetting.self, inMemory: true)
}
