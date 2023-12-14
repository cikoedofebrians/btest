//
//  SplashView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 02/12/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image("btest-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 280, height: 280)
        }
 
    }
}

#Preview {
    SplashView()
}
