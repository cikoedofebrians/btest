//
//  BeepTableView.swift
//  btest
//
//  Created by Ciko Edo Febrian on 14/12/23.
//

import SwiftUI

struct BeepTableView: View {
    let columnName: [String] = ["Rating", "Excellent", "Good", "Above Average", "Average", "Below Average", "Poor", "Very Poor"]
    
    func getStringFromClosedRange(range: ClosedRange<Double>) -> some View {
        var formattedString = ""
        if (range.upperBound.isInfinite) {
           formattedString = String(format: "> %.0f", range.lowerBound)
        }else if (range.lowerBound == 0.0) {
            formattedString = String(format: "< %.0f", range.upperBound)
        } else {
           formattedString = String(format: "%.0f - %.0f", range.lowerBound, range.upperBound)
        }
 
        
        return Text(formattedString)
            .frame(height: 60)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            RedBackButton()
            
            Text("VO2MAX Ratings")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
                .padding(.bottom, 8)
            GeometryReader { geo in
                HStack (spacing: 0){
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(columnName, id: \.self) { name in
                            Text(name)
                                .bold()
                                .padding(.vertical, 8)
                                .lineLimit(2)
                                .minimumScaleFactor(0.1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                                .frame(height: 60)
                            
                        }
                        Spacer()
                    }
                    .frame(width: geo.size.width * 0.35)
                    
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 0) {
                            ForEach(K.beepClassList) { beepClass in
                                VStack(alignment: .center, spacing: 0) {
                                    Text("\(beepClass.age.lowerBound) - \(beepClass.age.upperBound)")
                                        .frame(height: 60)
                                        .bold()
                                    getStringFromClosedRange(range: beepClass.excellentRange)
                                    getStringFromClosedRange(range: beepClass.good)
                                    getStringFromClosedRange(range: beepClass.aboveAverage)
                                    getStringFromClosedRange(range: beepClass.average)
                                    getStringFromClosedRange(range: beepClass.belowAverage)
                                    getStringFromClosedRange(range: beepClass.poor)
                                    getStringFromClosedRange(range: beepClass.veryPoor)
                                    Spacer()
                                } .padding(.horizontal, 16)
                            }
                            
                        }
                    }
                }
            }
            .background(
                VStack(spacing: 0) {
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 8, topTrailing: 8))
                        .fill(Color.red)
                        .frame(height: 60)
                    
                    
                    ForEach(1..<7) { index in
                        if (index % 2 == 1) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(height: 60)
                        }else {
                            Rectangle()
                                .fill(Color(UIColor.darkGray))
                                .frame(height: 60)
                        }
                        
                    }
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 8, bottomTrailing: 8))
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: 60)
                    
                    Spacer()
                }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BeepTableView()
}
