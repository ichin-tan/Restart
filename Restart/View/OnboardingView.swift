//
//  OnboardingView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage(StorageKeys.isOnboardingViewActive.key) var isOnboardingViewActive = true
    @State private var isAnimating: Bool = false
    
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
                        .onAppear() {
                            self.isAnimating = true
                        }
                        .opacity(self.isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: self.isAnimating)

                } //: End of center
                
                //MARK: - Footer
                
                DraggableCircleView() {
                    withAnimation(Animation.easeOut(duration: 1)) {
                        self.isOnboardingViewActive = false
                    }
                }
                
                Spacer()
            } //: VStack
        }
    }
}

#Preview {
    OnboardingView()
}
