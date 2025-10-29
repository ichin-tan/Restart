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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(self.opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(color.opacity(self.opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
    }
}

#Preview {
    RingView(color: .colorBlue, opacity: 0.2)
}
