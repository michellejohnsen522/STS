//
//  HomeView.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import SwiftUI

struct HomeView: View {
    
    var completion: () -> ()
    @State var news: [News] = []
    @State var isNewsDetailed = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    LazyVStack {
                        Text("News: ")
                            .frame(width: screenSize().width - 20, alignment: .leading)
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                            .padding(.top, 20)
                        
                        
                        
                        ForEach(news, id: \.self) { news in
                            NavigationLink {
                                NewsDetailsView(news: news) {
                                    completion()
                                }
                                    .navigationBarBackButtonHidden()
                            } label: {
                                ZStack {
                                    VStack {
                                        if let url = URL(string: news.image) {
                                            AsyncImage(url: url) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: screenSize().width - 50, height: 250)
                                                    .clipped()
                                                    .cornerRadius(12, corners: [.topLeft, .topRight])
                                                
                                            } placeholder: {
                                                ProgressView()
                                                    .controlSize(.large)
                                                    .colorMultiply(.white)
                                                    .frame(width: screenSize().width - 40, height: 250)
                                            }
                                        }
                                        
                                        Text(news.header)
                                            .foregroundColor(.white)
                                            .frame(width: screenSize().width - 50, alignment: .leading)
                                            .font(.system(size: 22, weight: .bold))
                                    }
                                }
                                .padding(10)
                                .background(Rectangle().foregroundColor(.softBlue).cornerRadius(12))
                            }

                        }
                        
                    }
                    VStack {
                        
                    }
                    .frame(height: 150)
                }
                .hideScrollIndicator()
                .padding(.top, 150)
                
                
                VStack {
                    Rectangle()
                        .frame(height: screenSize().height < 737 ? 160 : 190)
                        .cornerRadius(12)
                        .foregroundColor(.lightBlue)
                        .ignoresSafeArea()
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            HStack(spacing: 10) {
                                
                                Image("logo")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                
                                Text("Gaming")
                                    .font(.system(size: 55, weight: .black))
                                    .foregroundColor(Color.white)
                            }
                            .padding(.bottom, screenSize().height < 737 ? 0 : 80)
                        }
                    
                    Spacer()
                }
                
            }

        }
        .modifier(HideTabBar())
        .onAppear {
            NetworkManager.shared.fetchNews { result in
                switch result {
                case .success(let data):
                    news = data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    HomeView(){}
}
