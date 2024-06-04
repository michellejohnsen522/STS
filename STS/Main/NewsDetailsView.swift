//
//  NewsDetailsView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct NewsDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var news: News
    var completion: () -> ()

    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        if let url = URL(string: news.image) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: screenSize().width, height: 350)
                                    .clipped()
                                    .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                            } placeholder: {
                                ProgressView()
                                    .controlSize(.large)
                                    .colorMultiply(.white)
                                    .frame(width: screenSize().width - 40, height: 250)
                            }
                        }
                                                   
                        VStack(alignment: .leading) {
                            Text(news.header)
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .bold))
                            
                            Text(news.body)
                                .padding(.top)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                            
                        }
                        .padding()
                        .background(Color.softBlue.cornerRadius(12))
                        .offset(y: -30)
                        
                        
                        Spacer()
                    }
                }
                .hideScrollIndicator()
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 10) {
                        
                        Button {
                            completion()
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                                                        
                        Spacer()
                    }
                
                }
            }
        }
        .onAppear {
            completion()
        }
    }
    
    func openSafari(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    NewsDetailsView(news: .MOCK){}
}
