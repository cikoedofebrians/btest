//
//  HistoryView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 12/12/23.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
        @StateObject var historyViewModel: HistoryViewModel
    
        init(modelContext: ModelContext) {
            _historyViewModel = StateObject(wrappedValue: HistoryViewModel(modelContext: modelContext))
        }
    
    @State var isEditable: Bool = false
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            VStack (alignment: .leading, spacing: 16) {
                Group {
                    HStack {
                        RedBackButton()
                        Spacer()
                        Image(systemName: "pencil")
                            .font(.title2)
                            .padding(12)
                            .background(Circle().fill(isEditable ? .green : .blue))
                            .onTapGesture {
                                withAnimation {
                                    isEditable.toggle()
                                }
                            }
                            .foregroundStyle(.white)
                            .padding(.top, 16)
                        NavigationLink {
                            BeepTableView()
                        } label: {
                            Image(systemName: "chart.bar.fill")
                                .font(.title2)
                                .padding(12)
                                .background(Circle().fill(.gray))
                                .foregroundStyle(.white)
                                .padding(.top, 16)
                        }
                        
                        
                    }
                    Text("Your History")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                }
                .padding(.horizontal, 16)
                if (historyViewModel.beepHistories.isEmpty) {
                    Text("You don't have any beep test result yet! Perhaps its time to try for it. 🔥")
                        .multilineTextAlignment(.center)
                        .padding(.top, 240)
                        .padding(.horizontal, 40)
                        
                } else {
                    ForEach(historyViewModel.beepHistories) { result in
                        HistoryCard(isEditable: $isEditable, beepResult: result)
                            .environmentObject(historyViewModel)
                    }
                }

            }
        }
        .navigationBarBackButtonHidden()
    }
}

