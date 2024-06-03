//
//  LottieManager.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import SwiftUI
import Lottie


enum Anim: String {
    case profile = "profile"
}

struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFill
        return animationView
    }
}

struct AnimationView: View {
    
    var animation: String
    var loop: LottieLoopMode
    var weight: CGFloat
    var height: CGFloat
    
    var body: some View {
        LottieView(animationFileName: animation, loopMode: loop)
            .frame(width: 10, height: 10)
    }
}
