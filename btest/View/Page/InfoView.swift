//
//  InfoView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/11/23.
//

import SwiftUI

struct InfoView: View {
    @State private var isLevelShown: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                .navigationBarBackButtonHidden()
            ScrollView {
                VStack (alignment: .leading ){
                    RedBackButton()
                    
                    Text("Beep Test")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                    
                    Text(K.beepDescription)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .padding(.bottom, 8)
                    
                    Text("Tutorials")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                    
                    TutorialsItem()
                    
                    
                    NavigationLink {
                        StageView()
                    } label: {
                        HStack {
                            Text("See all stages")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.red)
                        )
                        .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 20)
            }
      
        }
    }
}

#Preview {
    InfoView()
}
