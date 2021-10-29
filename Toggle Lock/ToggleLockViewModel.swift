//
//  ToggleLockViewModel.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import LocalAuthentication

class ToggleLockViewModel: ObservableObject {
    @Published var isLockEnabled = false
    @Published var isUnlocked = false
    
    init() {
        getLockStatus()
    }
    
    func lock() {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isAppLockEnabled.rawValue)
        self.isLockEnabled = true
    }
    
    func unlock() {
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isAppLockEnabled.rawValue)
        self.isLockEnabled = false
    }
    
    func getLockStatus() {
        isLockEnabled = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isAppLockEnabled.rawValue)
    }
    
    func getBiometricStatus() -> Bool {
        var error: NSError?
        let laContext = LAContext()
        let biometricStatus = laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if let error = error {
            print(error.localizedDescription)
        }
        return biometricStatus
    }
    
    func changeLockStatus(lockStatus: Bool) {
        let laContext = LAContext()
        if getBiometricStatus() {
            let reason = "Идентифицируйте себя, пожалуйста."
            laContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { _, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    if lockStatus{
                        self.lock()
                    } else {
                        self.unlock()
                    }
                }
            }
        }
    }
    
    func openApp() {
        let laContext = LAContext()
        if getBiometricStatus() {
            let reason = "Идентифицируйте себя, пожалуйста."
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else{
                        if let error = error{
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}
enum UserDefaultsKeys: String {
    case isAppLockEnabled
}
