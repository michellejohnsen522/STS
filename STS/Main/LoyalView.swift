//
//  LoyalView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct LoyalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("Loyalty Programm")
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
                    .padding(.top, 40)
                
                Text("STS Gaming provides its users with the opportunity to participate in the loyalty program and level up. You can find out more below")
                    .padding(.horizontal)
                    .padding(.top)
                    .foregroundColor(.gray)
                
                VStack {
                    ScrollView {
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: screenSize().width / 1.1, height: 220)
                            .padding(.vertical)
                            .foregroundColor(.softBlue)
                            .overlay {
                                HStack {
                                    VStack {
                                        Text("Level")
                                            .font(.system(size: 22, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                        Text("1")
                                            .font(.system(size: 72, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("Beginer")
                                            .font(.system(size: 22, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                            .padding(.bottom)
                                        
                                        Text("Receive a 5% Discount on Room Rentals Starting from the First Hour")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 200)
                                }
                                .padding(.horizontal, 30)
                            }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: screenSize().width / 1.1, height: 250)
                            .padding(.vertical)
                            .foregroundColor(.softBlue)
                            .overlay {
                                HStack {
                                    VStack {
                                        Text("Level")
                                            .font(.system(size: 22, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                        Text("2")
                                            .font(.system(size: 72, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("True Gamer")
                                            .font(.system(size: 22, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                            .padding(.bottom)
                                        
                                        Text("Receive a 10% Discount. \nAbility to save your progress in story games.")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 200)
                                }
                                .padding(.horizontal, 30)
                            }
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: screenSize().width / 1.1, height: 250)
                            .padding(.vertical)
                            .foregroundColor(.softBlue)
                            .overlay {
                                HStack {
                                    VStack {
                                        Text("Level")
                                            .font(.system(size: 22, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                        Text("3")
                                            .font(.system(size: 72, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("VIP Player")
                                            .font(.system(size: 22, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                            .padding(.bottom)
                                        
                                        Text("Receive a 15% Discount. \nAll previous improvements + the ability to participate in game draws, as well as access to special events.")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 200)
                                }
                                .padding(.horizontal, 30)
                            }
                        
                    }
                    .hideScrollIndicator()
                }
                
                Spacer()
            }
        }
        .overlay {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoyalView()
}
