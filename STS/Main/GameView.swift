//
//  GameView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct GameView: View {
    
    var category: CategoryGame
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    ScrollView {
                        ForEach(category.categoryGames, id: \.self) { game in
                            Rectangle()
                                .foregroundColor(.softBlue)
                                .cornerRadius(25)
                                .frame(width: screenSize().width - 20, height: 120)
                                .overlay {
                                    HStack {
                                        ImageView(stringURL: game.gameImage)
                                            .frame(width: 120, height: 120)
                                            .cornerRadius(25)
                                            .scaleEffect(0.94)
                                        
                                        VStack (alignment: .leading, spacing: 10){
                                            HStack {
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Image(systemName: "gamecontroller")
                                                    Image(systemName: "person")
                                                    
                                                }
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Text(game.gameTitle)
                                                    Text("Players: \(game.gamePlayers)")
                                                    
                                                }
                                                
                                            }
                                            
                                            
                                        }
                                        .foregroundColor(.white)
                                        
                                        Spacer()
                                    }
                                    
                                }
                        }
                    }
                }
                
            }
            //MARK: - NavBar
            //.modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        VStack {
                            HStack(spacing: 0) {
                                
                                Text("\(category.categoryTitle)")
                                    .font(.system(size: 28, weight: .black))
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                            }
                            
                        }
                        Spacer()
                    }
                    .ignoresSafeArea()
                }
            }
        }
        
    }
}

#Preview {
    GameView(category: .MOCK)
}
