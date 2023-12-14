//
//  ContentView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 01/11/23.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @State var isSplashDone: Bool = false
    @StateObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        Group {
            if (isSplashDone) {
                TimerView()
                    .environmentObject(homeViewModel)
            }else {
                SplashView()
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isSplashDone = true
            }
        }
        
    }
    
    init(modelContext: ModelContext) {
        let homeViewModel = HomeViewModel(context: modelContext)
        _homeViewModel = StateObject(wrappedValue: homeViewModel)
    }
}
//4
