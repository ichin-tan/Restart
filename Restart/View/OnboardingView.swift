//
//  OnboardingView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage(StorageKeys.isOnboardingViewActive.key) var isOnboardingViewActive = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding View")
                .font(.largeTitle)
            
            Button {
                self.isOnboardingViewActive = false
            } label: {
                Text("Start")
            }
        }
    }
}

#Preview {
    OnboardingView()
}
