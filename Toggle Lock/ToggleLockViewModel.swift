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
        isLockEnabled = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLockEnabled.rawValue)
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
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                if success {
                    DispatchQueue.main.async {
                        if lockStatus {
                            self.isLockEnabled = true
                            UserDefaults.standard.set(self.isLockEnabled, forKey: UserDefaultsKeys.isLockEnabled.rawValue)
                        } else {
                            self.isLockEnabled = false
                            UserDefaults.standard.set(self.isLockEnabled, forKey: UserDefaultsKeys.isLockEnabled.rawValue)
                        }
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
                    }
                    if let error = error{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

enum UserDefaultsKeys: String {
    case isLockEnabled
}
