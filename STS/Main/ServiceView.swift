//
//  ServiceView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct ServiceView: View {
    
    var completion: () -> ()
    var rooms = ["User Info", "Games", "Your Bookings"]
    var images = ["person.fill", "playstation.logo", "magazine"]
    
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    VStack {
                        LazyVGrid(
                            columns: adaptiveColumn, spacing: 30, content: {
                                ForEach(0..<rooms.count, id:\.self) { index in
                                    NavigationLink {
                                        switch index {
                                        case 0: UserInfoView() {
                                            completion()
                                        }
                                        case 1: GameCategoryView() {
                                            completion()
                                        }
                                        case 2: BookingsView() {
                                            completion()
                                        }
                                        default: BookingsView() {
                                            completion()
                                        }
                                        }
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.softBlue)
                                                .frame(width: 160, height: 150)
                                                .cornerRadius(20)
                                                .shadow(color: .softBlue, radius: 2)
                                            
                                            VStack {
                                                Image(systemName: images[index])
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40, height: 40)
                                                    .foregroundColor(.white)
                                                
                                                Text(rooms[index])
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .medium))
                                                    .padding(.top, 20)
                                            }
                                        }
                                    }
                                }
                            })
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
                
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 10) {
                        Text("Service")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .modifier(HideTabBar())
        .tint(.white)
    }
}

#Preview {
    ServiceView(){}
}
