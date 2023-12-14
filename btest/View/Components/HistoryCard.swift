//
//  HistoryCard.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//



import SwiftUI

struct HistoryCard: View {
    @Binding var isEditable: Bool
    let beepResult: BeepResult
    @EnvironmentObject var historyViewModel: HistoryViewModel
    

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.black)
                .frame(width: 120, height: 120)
                .overlay {
                    VStack {
                        Text(String(format: "%.0f", beepResult.vo2max))
                            .font(.title)
                            .bold()
                            .padding(.bottom, 2)
                        Text("VO2MAX")
                    }
                }
            
            
            
            VStack (alignment: .leading){
                Text(beepResult.date.formatDate())
                    .padding(.bottom, 8)
                Group {
                    HStack {
                        Text("Total distance:")
                       
                        Spacer()
                        Text("\(beepResult.distances)m")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Stage")
                        Spacer()
                        
                        Text("\(beepResult.stage).\(beepResult.shuttles)")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Result")
                        Spacer()
                        Text(beepResult.getResult().result.toString())
                            .fontWeight(.semibold)
                    }
                    
                }
                .font(.system(size: 14))
            }
            
            .frame(maxHeight: .infinity)
            
            .foregroundStyle(.black)
            
        }
        .overlay(alignment: .topTrailing, content: {
            
            
            Group {
                Image(systemName: "minus")
                    .offset(CGSize(width: 16, height: -16))
                    .background(Circle()
                        .fill(.red)
                        .frame(width: 32, height: 32)
                        .offset(CGSize(width: 16, height: -16)))
                    .onTapGesture {
                        historyViewModel.deleteData(beepResult: beepResult)
                    }
            }
            .opacity(isEditable ? 1 : 0)
         

        })
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal)
        
    }
        
    
}
//
//#Preview {
//    HistoryCard(isEditable: .constant(true),beepResult: BeepResult(stage: 14, shuttles: 7, distances: 220))
//}
