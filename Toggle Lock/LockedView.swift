//
//  LockedView.swift
//  Toggle Lock
//
//  Created by Marius Malyshev on 28.10.2021.
//

import SwiftUI

struct LockedView: View {
    @EnvironmentObject var toggleLockViewModel: ToggleLockViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "lock")
                .font(.system(size: 100))
                .onTapGesture {
                    toggleLockViewModel.changeLockStatus(lockStatus: false)
                }
        }
    }
}

struct LockedView_Previews: PreviewProvider {
    static var previews: some View {
        LockedView()
    }
}
