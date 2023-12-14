//
//  Helper.swift
//  btest
//
//  Created by Ciko Edo Febrian on 05/12/23.
//

import Foundation


class Helper {
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy 'at' HH.mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return dateFormatter.string(from: date)
    }
}
