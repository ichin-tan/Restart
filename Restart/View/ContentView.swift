//
//  ContentView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct ContentView: View {
    
    // AppStorage is a property wrapper that uses user defaults under the hood, It's purpose is the same as user defaults (to save data permanently in local data)
    @AppStorage(StorageKeys.isOnboardingViewActive.key) private var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if(self.isOnboardingViewActive) {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
