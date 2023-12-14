//
//  HistoryViewModel.swift
//  btest
//
//  Created by Ciko Edo Febrian on 05/12/23.
//

import Foundation
import SwiftUI
import SwiftData


class HistoryViewModel : ObservableObject {
    @Published var beepHistories: [BeepResult] = []
    let modelContext: ModelContext
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<BeepResult>(sortBy: [SortDescriptor(\.date)])
            beepHistories = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    
    func deleteData(beepResult: BeepResult) {
        withAnimation {
            modelContext.delete(beepResult)
            fetchData()
        }
    }
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
}
