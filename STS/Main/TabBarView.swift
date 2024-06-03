//
//  TabBarView.swift
//  STS
//
//  Created by admin on 6/3/24.
//


import SwiftUI

struct TabBarView: View {
    
    @State private var isBarShown = true
    @State private var activeTab: Tab = .home
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            TabView(selection: $activeTab) {
               HomeView() {
                    isBarShown.toggle()
                }
                    .tag(Tab.home)
                
                ClubListView()
                    .tag(Tab.clubs)
                
                CodeView()
                    .tag(Tab.qr)
                
                ServiceView() {
                    isBarShown.toggle()
                }
                    .tag(Tab.service)
                
                SettingsView()
                    .tag(Tab.settings)
            }
                
            if isBarShown {
                VStack(spacing: 0) {
                    Spacer()
                    CustomTabBar(activeTab: $activeTab)
                }
                .ignoresSafeArea(.all, edges: .bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            DataManager.shared.createInitialData()
        }
    }
}


#Preview {
    TabBarView()
}
