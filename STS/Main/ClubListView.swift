//
//  ClubListView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct ClubListView: View {
    
    var countries = ["Portugal", "Spain", "Germany", "Poland", "Romania", "Finland"]
    @State var selectedCountry = "Portugal"
    
    @State var clubList: [Club] = []
    @State var allClubs: [Club] = []

    @State var isShown = false
    @State var isMapShown = false
    @State var isAlertShown = false
    @State var offset = 1000
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    
                    DividerView()
                        .padding(.top)
                    HStack {
                        Text("Select Country")
                            .onChange(of: selectedCountry) { _ in
                                clubList = []
                                clubList = filterClubs(byCountry: selectedCountry, from: allClubs)
                                UserDefaults.standard.setValue(selectedCountry, forKey: "selectedCountry")
                            }
                        
                        Spacer()
                        
                        Picker("", selection: $selectedCountry) {
                            ForEach(countries, id: \.self) { country in
                                Text(country)
                               
                            }
                        }
                        .tint(.white)
                    }
                   
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    DividerView()
                    
                    ScrollView {
                        VStack {
                            ForEach(clubList, id: \.name) { club in
                                ClubCellView(club: club) {
                                    isShown.toggle()
                                } location: {
                                    isMapShown.toggle()
                                } copy: {
                                    isAlertShown.toggle()
                                    withAnimation {
                                        offset = 0
                                    }
                                }
                                
                                .fullScreenCover(isPresented: $isShown) {
                                    ReservView(club: club)
                                }
                                .fullScreenCover(isPresented: $isMapShown) {
                                    LocationView(club: club)
                                }
                            }
                            
                            VStack {
                                
                            }
                            .frame(height: 100)
                        }
                    }
                    .hideScrollIndicator()
                    
                    Spacer()
                }
                
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 10) {
                        Text("Gaming Clubs")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .overlay {
            if isAlertShown {
                Rectangle()
                    .frame(width: 300, height: 100)
                    .cornerRadius(12)
                    .foregroundColor(.gray)
                    .shadow(radius: 10)
                    .overlay {
                        Text("The message has been copied to the clipboard.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .offset(y: CGFloat(offset))
                    .animation(.bouncy, value: isAlertShown)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                offset = 1000
                                isAlertShown.toggle()
                            }
                        }
                    }
            }
        }
        .onAppear {
            selectedCountry = UserDefaults.standard.value(forKey: "selectedCountry") as? String ?? "Portugal"
            
            NetworkManager.shared.fetchClubs { result in
                switch result {
                case .success(let clubs):
                    allClubs = clubs
                    clubList = filterClubs(byCountry: selectedCountry, from: allClubs)

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            
        }
    }
    
    func filterClubs(byCountry country: String, from clubs: [Club]) -> [Club] {
        return clubs.filter { $0.country == country }
    }
}

#Preview {
    ClubListView()
}
