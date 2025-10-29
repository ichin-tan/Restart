//
//  OnboardingHeaderView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct OnboardingHeaderView: View {
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
    }
}

#Preview {
    OnboardingHeaderView()
}
