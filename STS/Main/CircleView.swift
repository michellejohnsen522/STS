//
//  CircleView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct CircleView: View {
    
    var value: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: value)
                .stroke(Color.semiYellow, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 200, height: 200)
            VStack {
                Text("1")
                    .font(.system(size: 62, weight: .bold))
                
                Text("Level")
                    .font(.system(size: 32, design: .monospaced))
            }
            .foregroundColor(.white)
            
        }
    }
}

#Preview {
    CircleView(value: 0.5)
}

