//
//  RingView.swift
//  Restart
//
//  Created by CP on 28/10/25.
//

import SwiftUI

struct RingView: View {
    
    @State var color: Color
    @State var opacity: Double
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(self.opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(color.opacity(self.opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .onAppear() {
            self.isAnimating = true
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(Animation.easeIn(duration: 1.0), value: isAnimating)
    }
}

#Preview {
    RingView(color: .colorBlue, opacity: 0.2)
}
