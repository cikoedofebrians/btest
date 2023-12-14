//
//  UserDefaults.swift
//  btest
//
//  Created by Ciko Edo Febrian on 04/12/23.
//

import Foundation


extension UserDefaults {
    func isKeyExist(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
