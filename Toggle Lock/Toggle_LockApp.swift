//
//  Toggle_LockApp.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import SwiftUI

@main
struct Toggle_LockApp: App {
    @StateObject var toggleLockViewModel = ToggleLockViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(toggleLockViewModel)
                .onChange(of: scenePhase) { sceneMode in
                    switch sceneMode {
                    case .background:
                        toggleLockViewModel.isUnlocked = false
                    case .inactive:
                        print("inactive")
                    case .active:
                        print("active")
                    @unknown default:
                        print("unknown")
                    }
                }
        }
    }
}
