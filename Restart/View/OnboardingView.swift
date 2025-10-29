//
//  OnboardingView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI
import UIKit

struct OnboardingView: View {
    
    @AppStorage(StorageKeys.isOnboardingViewActive.key) var isOnboardingViewActive = true
    @State private var isAnimating: Bool = false
    @State private var imageOffset : CGSize = .zero
    @State private var indicationOpacity: Double = 1.0
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
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
                        .offset(x: self.imageOffset.width * -1)
                        .blur(radius: abs(self.imageOffset.width / 10))
                        .rotationEffect(.degrees(Double((self.imageOffset.width / 15) * -1)))
                        .animation(Animation.easeOut(duration: 1), value: self.imageOffset)
                        
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .onAppear() {
                            self.isAnimating = true
                        }
                        .opacity(self.isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: self.isAnimating)
                        .offset(x: self.imageOffset.width, y: 0)
                        .rotationEffect(.degrees(Double(self.imageOffset.width / 15)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if(abs(gesture.translation.width) <= 150) {
                                        self.imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)) {
                                            self.indicationOpacity = 0
                                        }
                                    }
                                })
                                .onEnded({ gesture in
                                    self.imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        self.indicationOpacity = 1
                                    }
                                })
                        )
                        .animation(Animation.easeInOut(duration: 1), value: self.imageOffset)

                } //: End of center
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44))
                        .offset(y: 20)
                        .foregroundColor(.white)
                        .fontWeight(.ultraLight)
                        .opacity(self.isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(self.indicationOpacity)
                    ,
                    alignment: .bottom
                )
                
                //MARK: - Footer
                
                DraggableCircleView() {
                    withAnimation(Animation.easeOut(duration: 1)) {
                        self.isOnboardingViewActive = false
                        AudioPlayer.shared.playSound(title: "chimeup", type: "mp3")
                        self.hapticFeedback.notificationOccurred(.success)
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
