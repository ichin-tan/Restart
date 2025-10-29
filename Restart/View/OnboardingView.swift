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
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                Spacer()

                //MARK: - Header
                
                OnboardingHeaderView()
                
                //MARK: - Center
                
                ZStack {
                    RingView(color: .white, opacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: End of center
                
                //MARK: - Footer
                
                DraggableCircleView {
                    self.isOnboardingViewActive = false
                }
                
                Spacer()
            } //: VStack
        }
    }
}

#Preview {
    OnboardingView()
}
