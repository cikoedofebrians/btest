//
//  ResultView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 03/12/23.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var beepResult: BeepResult
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if (beepResult.stage == 0 && beepResult.shuttles == 0) {
                Text("You haven't run for long enough, please try it more seriously next time! 🏃")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 36)
            }
            else {
                VStack(alignment: .leading){
                    Text("Result")
                        .bold()
                        .font(.title)
                        .padding([.horizontal, .top], 16)
                        .padding(.bottom, 24)
                    Text(beepResult.getResult().message)
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(beepResult.getResult().color.opacity(0.5))
                        .padding(.bottom, 16)
                    
                    HStack {
                        VStack {
                            Image(systemName: "figure.run")
                                .font(.system(size: 80))
                                .padding(.bottom, 4)
                            Text("Stage:")
                        }
                        
                        Spacer()
                        Text("\(beepResult.stage) . \(beepResult.shuttles)")
                            .font(.system(size: 48))
                            .bold()
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Text("Date: ")
                        Spacer()
                        Text(Helper.formatDate(beepResult.date))
                            .bold()
                            .font(.title2)
                    }
                    .padding(16)
                    .background(.gray.opacity(0.5))
                    .padding(.bottom, 8)
                    HStack {
                        Text("VO2 Max: ")
                        Spacer()
                        Text(String(format: "%.2f", beepResult.vo2max))
                            .bold()
                            .font(.title2)
                    }
                    .padding(16)
                    .background(.gray.opacity(0.5))
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("Distance: ")
                        Spacer()
                        Text("\(beepResult.distances) m")
                            .bold()
                            .font(.title2)
                    }
                    .padding(16)
                    .background(.gray.opacity(0.5))
                    Spacer()
                }
            }
            
        }
        .foregroundStyle(.white)
        
    }
}

#Preview {
    ResultView( beepResult: .constant( BeepResult(stage: 2, shuttles: 5, distances: 20)))
}
