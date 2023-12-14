//
//  btestApp.swift
//  btest
//
//  Created by Ciko Edo Febrian on 01/11/23.
//

import SwiftUI
import SwiftData

@main
struct btestApp: App {
    
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(modelContext: container.mainContext)
            }
            .modelContainer(container)
            .navigationBarBackButtonHidden()
            .toolbar(.hidden)
        }
    }
    
    init() {
        do {
            container = try ModelContainer(for: BeepResult.self)
        } catch {
            fatalError("Failed to create model container for beep result")
        }
    }
}
