//
//  ToggleView.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import SwiftUI

struct ToggleView: View {
    @EnvironmentObject private var toggleLockViewModel: ToggleLockViewModel
    
    var body: some View {
        Toggle("Change Lock Status", isOn: $toggleLockViewModel.isLockEnabled)
            .onChange(of: toggleLockViewModel.isLockEnabled) { value in
                toggleLockViewModel.changeLockStatus(lockStatus: value)
                print(value)
            }
            .padding()
    }
}
