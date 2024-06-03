//
//  ProfileCardView.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(height: 350)
                    .cornerRadius(12)
                    .foregroundColor(.lightBlue)
                    .ignoresSafeArea()
                    .shadow(color: .black, radius: 10)
                    .overlay {
                        HStack {
                            VStack {
                                Spacer()
                                
                                LottieView(animationFileName: "profile", loopMode: .loop)
                                    .frame(width: 150, height: 150)
                                    .scaleEffect(0.15)
                                
                                
                                Button {
                                    
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 130, height: 40)
                                            .cornerRadius(8)
                                        
                                        Text("Edit")
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.top, 20)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 1) {
                                Spacer()
                                
                                Text("Welcome!")
                                    .font(.system(size: 25, weight: .bold))
                                
                                CircleView(value: 0.5)
                                    .frame(width: 150, height: 150)
                                    .scaleEffect(0.5)
                                Text("Credits:")
                                    .font(.system(size: 18, weight: .bold))
                                
                                
                            }
                            .padding(.bottom, 40)
                            .foregroundColor(.white)
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom, 110)
                    }
                
                
                
            }
            
            Spacer()
        }

    }
}

#Preview {
    ProfileCardView()
}
