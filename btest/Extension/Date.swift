//
//  Date.swift
//  btest
//
//  Created by Ciko Edo Febrian on 14/12/23.
//

import Foundation


extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let formattedString = dateFormatter.string(from: self)
        
        return formattedString
    }
}

