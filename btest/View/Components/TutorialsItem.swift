//
//  TutorialsItem.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//

import SwiftUI

struct TutorialsItem: View {
//    let tutorials: KeyValuePairs<String, String>
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(K.tutorialSteps, id: \.key) { tutor in
                HStack {
                    Text("\(tutor.key): ")
                        .bold()
                    + Text(tutor.value)
                }
                .foregroundStyle(.white)
                .padding(.bottom, 8)
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    TutorialsItem()
}
