//
//  StarterView.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var toggleLockViewModel: ToggleLockViewModel

    var body: some View {
        Group {
            if !toggleLockViewModel.isLockEnabled || toggleLockViewModel.isUnlocked {
                ToggleView()
                    .environmentObject(toggleLockViewModel)
            } else {
                LockedView()
                    .environmentObject(toggleLockViewModel)
            }
        }
        .onAppear {
            if toggleLockViewModel.isLockEnabled {
                toggleLockViewModel.openApp()
            }
        }
    }
}

