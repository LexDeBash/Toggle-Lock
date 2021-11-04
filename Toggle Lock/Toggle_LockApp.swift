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
    
    @State var blurRadius: CGFloat = 0
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(toggleLockViewModel)
                .blur(radius: blurRadius)
                .onChange(of: scenePhase) { sceneMode in
                    switch sceneMode {
                    case .background:
                        toggleLockViewModel.isUnlocked = false
                    case .inactive:
                        blurRadius = 5
                    case .active:
                        blurRadius = 0
                    @unknown default:
                        print("unknown")
                    }
                }
        }
    }
}
