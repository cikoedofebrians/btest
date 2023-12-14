//
//  RedBackButton.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//

import SwiftUI

struct RedBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Image(systemName: "arrow.left")
            .font(.title2)
            .padding(12)
            .background(Circle().fill(.red))
            .foregroundStyle(.white)
            .onTapGesture {
                dismiss()
            }
            .padding(.top, 16)
    }
}

#Preview {
    RedBackButton()
}
