//
//  HomeView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage(StorageKeys.isOnboardingViewActive.key) var isOnboardingViewActive = true
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            // Header
            
            ZStack {
                RingView(color: .gray, opacity: 0.2)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            // Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Footer
            Spacer()

            Button {
                self.isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .foregroundColor(.white)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        }
    }
}

#Preview {
    HomeView()
}
