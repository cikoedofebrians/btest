//
//  StageView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//

import SwiftUI

struct StageView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            ScrollView {
                VStack (alignment: .leading){
                    RedBackButton()
                    Text("Stage List")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                    ForEach(K.beepStagesList) { stage in
                        StageCard(stage: stage)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        
    }
}

#Preview {
    StageView()
}
