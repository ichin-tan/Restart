//
//  Draggable.swift
//  Restart
//
//  Created by CP on 29/10/25.
//

import SwiftUI

struct DraggableCircleView: View {
    
    private let buttonGetStartedWidth = UIScreen.main.bounds.width - 80
    @State private var draggableCircleOffset: CGFloat = 0
    var action: (() -> ())? = nil
    
    var body: some View {
        ZStack {
            
            // BACKGROUND
            
            Capsule()
                .fill(.white.opacity(0.2))
            
            Capsule()
                .fill(.white.opacity(0.2))
                .padding(10)
            
            
            // TEXT
            
            Text("Get Started")
                .foregroundColor(.white)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .offset(x: 20)
            
            // Dynamic capsule (Width Based on how much user drags)
            
            HStack {
                Capsule()
                    .fill(Color("ColorRed"))
                    .frame(width: self.draggableCircleOffset + 80)

                Spacer()
            }
            
            // Draggable Circle
            
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    
                    Circle()
                        .fill(.black.opacity(0.2))
                        .padding(7)
                    
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .offset(x: self.draggableCircleOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ gestureValue in
                            
                            if(gestureValue.translation.width > 0 && gestureValue.translation.width <= self.buttonGetStartedWidth - 80) {
                                self.draggableCircleOffset = gestureValue.translation.width
                            }
                        })
                        .onEnded({ gestureValue in
                            if(gestureValue.translation.width > self.buttonGetStartedWidth / 2) {
                                self.action?()
//                                self.isOnboardingViewActive = false
                            } else {
                                self.draggableCircleOffset = 0
                            }
                        })
                )
                
                Spacer()
            }
            
        }
        .frame(width: self.buttonGetStartedWidth, height: 80, alignment: .center)
        .padding()
    }
}

#Preview {
    DraggableCircleView()
}
