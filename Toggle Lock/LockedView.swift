//
//  LockedView.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import SwiftUI

struct LockedView: View {
    @EnvironmentObject private var toggleLockViewModel: ToggleLockViewModel
    
    var body: some View {
        Image(systemName: "lock")
            .font(.system(size: 100))
            .onTapGesture {
                toggleLockViewModel.openApp()
            }
    }
}
