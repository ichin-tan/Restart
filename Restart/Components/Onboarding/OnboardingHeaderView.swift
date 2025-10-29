//
//  OnboardingHeaderView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct OnboardingHeaderView: View {
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Share.")
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
            Text(
                """
                It's not about how much we give but
                how much love we put into giving.
                """
            )
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        }
        .onAppear() {
            self.isAnimating = true
        }
        .opacity(self.isAnimating ? 1 : 0)
        .offset(y: self.isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: self.isAnimating)
    }
}

#Preview {
    OnboardingHeaderView()
}
