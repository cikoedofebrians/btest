//
//  StageCard.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/11/23.
//

import SwiftUI

struct StageCard: View {
    
    let stage: BeepStage
    @State var isShown: Bool = false
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Stage \(stage.stage)")
                    .font(.system(size: 24))
                    .bold()
                Text("Number of shuttles: \(stage.shuttles)")
                    .font(.caption)
            }
            Spacer()
            Text(String(format: "%.1f", stage.speed))
                .font(.title)
                .bold()
            Text("km/h")
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 24)
        .background(                    RoundedRectangle(cornerRadius: 12)
            .strokeBorder(.white, style: StrokeStyle(lineWidth: 3))
            .shadow(color: .white, radius: 12))
        
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(stage.stage) * 0.12 ){
                withAnimation(.easeIn) {
                    isShown = true
                }
            }
        })
        .padding(.bottom, 8)
        .opacity(isShown ? 1 : 0)
        
    }
}

#Preview {
    StageCard(stage: K.beepStagesList[2])
        .previewLayout(.sizeThatFits)
        .background(Color.black)
}
