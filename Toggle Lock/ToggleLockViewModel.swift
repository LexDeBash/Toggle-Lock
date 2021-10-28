//
//  ToggleLockViewModel.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import LocalAuthentication
//import SwiftUI

class ToggleLockViewModel: ObservableObject {
    @Published var isLockEnabled = false
    @Published var isUnlocked = false
    
    func lock() {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isAppLockEnabled.rawValue)
        self.isLockEnabled = true
    }
    
    func unlock() {
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isAppLockEnabled.rawValue)
        self.isLockEnabled = false
    }
    
    func getLockState() {
        isLockEnabled = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isAppLockEnabled.rawValue)
    }
    
    enum UserDefaultsKeys: String {
        case isAppLockEnabled
    }
}
