//
//  ContentView.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var toggleLockViewModel: ToggleLockViewModel

    var body: some View {
        ZStack{
            if !toggleLockViewModel.isLockEnabled || toggleLockViewModel.isUnlocked {
                ToggleView()
                    .environmentObject(toggleLockViewModel)
            } else {
                LockedView()
                    .environmentObject(toggleLockViewModel)
            }
        }
        .onAppear{
            if toggleLockViewModel.isLockEnabled {
                toggleLockViewModel.openApp()
            }
        }
    }
}

