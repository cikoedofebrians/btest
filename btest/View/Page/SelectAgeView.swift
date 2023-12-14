//
//  SelectAgeView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 04/12/23.
//

import SwiftUI

struct SelectAgeView: View {
    @Environment(\.dismiss) var dismiss
    @State var age: Int = 0
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Please select your age")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal, 36)
                    .padding(.top, 16)
                Spacer()
                Picker("Select Age", selection: $age) {
                    ForEach(1..<101) { index in
                        Text("\(index)")
                    }
                }
                .foregroundStyle(.white)
                .pickerStyle(.wheel)
                Spacer()
                Button(action: {
                    UserDefaults.standard.setValue(age, forKey: "user_age")
                    if (UserDefaults.standard.isKeyExist(key: "user_age")){
                        dismiss()
                    }
                }, label: {
                    Text("Select age")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.red))
                        .padding(.horizontal, 36)
                })
            }
            .navigationBarBackButtonHidden()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SelectAgeView()
}
