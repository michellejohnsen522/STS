//
//  BookingsView.swift
//  STS
//
//  Created by admin on 6/3/24.
//



import SwiftUI

struct BookingsView: View {
    
    var completion: () -> ()
    @Environment(\.dismiss) var dismiss
    @State var reservations: [Reservation] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                
                VStack {
                    ScrollView {
                        ForEach(reservations, id: \.self) { res in
                            VStack {
                                Text(res.club)
                                    .font(.system(size: 32, weight: .bold))
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("Date: \(res.date)")
                                    
                                    Text("Time: \(res.time)")
                                    
                                    Text("Duration: \(res.selectedHour)")
                                    
                                    Text("Players: \(res.players)")
                                    
                                    Text("Name: \(res.name)")
                                }
                                .padding(.top, 10)
                                .frame(width: screenSize().width - 60, alignment: .leading)
                                
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Rectangle().foregroundColor(.softBlue).frame(width: screenSize().width - 20).cornerRadius(12))
                        }
                    }
                    .hideScrollIndicator()
                }
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
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    .overlay {
                        Text("Reservations")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            completion()
              reservations = Array(StorageManager.shared.reservations)
        }
    }
}

#Preview {
    BookingsView(){}
}
