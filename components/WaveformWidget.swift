//
//  WaveformWidget.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 14/07/23.
//

import SwiftUI

struct WaveformWidget: View {
    @State private var isAnimating = false
    var destination: Menu

    var body: some View {
        NavigationLink(value: destination) {
            
            
            ZStack{
                
                Circle()
                    .frame(width: isAnimating ? +170 : 150)
                
                    .foregroundColor(Color.pinkClr.opacity(0.4))
                
                Circle()
                    .frame(width: isAnimating ? +150 : 100)
                
                    .foregroundColor(Color.pinkClr.opacity(0.6))
                
                
                Image(systemName: "waveform")
                    .foregroundColor(.white)
                    .font(.system(size: 86))
                    .background(
                        Circle()
                            .fill(Color.pinkClr)
                            .frame(width: 100, height: 100)
                        
                    )
                
                
                
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.isAnimating = true
                    }
                }
            
    }
}

//struct WaveformWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        WaveformWidget()
//    }
//}
