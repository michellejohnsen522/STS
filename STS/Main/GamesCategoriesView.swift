

import SwiftUI

struct GameCategoryView: View {
    
    var completion: () -> ()
    @StateObject private var vm = GameCategoryViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    ScrollView {
                        ForEach(vm.categoies, id: \.self) { category in
                            NavigationLink {
                                GameView(category: category)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(category.categoryTitle)
                                        .font(.system(size: 28, weight: .black))
                                        .foregroundColor(Color.white)
                                    
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: screenSize().width / 1.1, height: 280)
                                        .overlay {
                                            ImageView(stringURL: category.categoryImage)
                                                .frame(width: screenSize().width / 1.1, height: 280)
                                                .cornerRadius(25)
                                        }
                                    
                                }
                            }
                            
                        }
                    }
                    .padding(.top, 20)
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
                        Text("Games")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .modifier(HideTabBar())
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.dark)
        .tint(.white)
        .onAppear {
            completion()
            Task {
                vm.categoies = try await NetworkManager.shared.fetchCategories()
                vm.categoies.removeLast()
            }
        }
    }
}

#Preview {
    GameCategoryView(){}
}


class GameCategoryViewModel: ObservableObject {
    
    @Published var categoies: [CategoryGame] = []

}

struct ImageView: View {
    
    var stringURL: String
    
    var body: some View {
        ZStack {
            if let url = URL(string: stringURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: 200, height: 200)
                }
                    
            }
        }
    }
}
