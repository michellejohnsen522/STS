//
//  CodeView.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import SwiftUI
import RealmSwift

struct CodeView: View {
    
    
    @State var user = User()
    @State var code = "22 22 22 22"
    @State var level = "1"
    @State var credits = "100"
    
    @State var isSheetShown = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    
                    Rectangle()
                        .frame(width: 200, height: 200)
                        .cornerRadius(12)
                        .shadow(color: .lightBlue, radius: 55)
                        .foregroundColor(.white)
                        .overlay {
                            Image("qr")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(12)
                        }
                    
                    Text("Show the QR code to the manager")
                        .padding()
                        .foregroundColor(.gray)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Code:")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .light, design: .monospaced))
                            
                            Text(code)
                                .padding(.vertical, 5)
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold, design: .default))
                            
                            Text("Level:")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .light, design: .monospaced))
                            
                            Text(level)
                                .padding(.vertical, 5)
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold, design: .default))
                            
                            Text("Credits:")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .light, design: .monospaced))
                            
                            Text(credits)
                                .padding(.vertical, 5)
                                .foregroundColor(.white)
                                .font(.system(size: 32, weight: .bold, design: .default))
                        }
                    }
                    .hideScrollIndicator()
                    .frame(width: screenSize().width - 20, alignment: .leading)
                    
                    Spacer()
                    
                }
                .padding(.top, 50)
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 10) {
                        Text("Loyalty")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        Button {
                            isSheetShown.toggle()
                        } label: {
                            Text("About")
                                .foregroundColor(.white)
                        }
                    }
                    .ignoresSafeArea()
                }
            }
            .sheet(isPresented: $isSheetShown) {
                LoyalView()
            }
        }
        .onAppear {
            user = StorageManager.shared.getUser()
            code = user.code
            level = user.level
            credits = "\(user.credits)"
        }
    }
}

#Preview {
    CodeView()
}
