//
//  UserInfoView.swift
//  STS
//
//  Created by admin on 6/3/24.
//





import SwiftUI

struct UserInfoView: View {
    
    var completion: () -> ()
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = UserInfoViewModel()
    
    @State var name = ""
    @State var surName = ""
    @State var email = ""
    @State var birthday = ""
    @State var number = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    VStack(spacing: 25) {
                        
                        TextField("", text: $name)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .placeholder(when: name.isEmpty) {
                                Text("Name").foregroundColor(.gray)
                            }
                        
                        DividerView()
                        
                        TextField("", text: $surName)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .placeholder(when: surName.isEmpty) {
                                Text("Surname").foregroundColor(.gray)
                            }
                        
                        DividerView()
                        
                        TextField("", text: $email)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .placeholder(when: email.isEmpty) {
                                Text("Email").foregroundColor(.gray)
                            }
                        
                        DividerView()
                        
                        TextField("", text: $birthday)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .placeholder(when: birthday.isEmpty) {
                                Text("Birthday").foregroundColor(.gray)
                            }
                        
                        DividerView()
                        
                        TextField("", text: $number)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .placeholder(when: number.isEmpty) {
                                Text("Phone Number").foregroundColor(.gray)
                            }
                            .keyboardType(.numberPad)
                        
                        DividerView()
                        
                        Text("This information will be used to reserve rooms in clubs.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray.opacity(0.5))
                        
                        Button {
                            StorageManager.shared.updateUser(name: name, surname: surName, email: email, birthday: birthday, number: number)
                            completion()
                            dismiss()
                        } label: {
                            Text("Save")
                                .frame(width: 200, height: 50)
                        }
                        .padding(.top, 40)
                        .buttonStyle(.borderedProminent)
                        .tint(.semiYellow)
                    }
                    
                    .padding(.horizontal)
                }
                .padding(.top, 40)
            }
            .onAppear {
                vm.fetchUser()
                
                name = vm.user.name
                surName = vm.user.surname
                email = vm.user.email
                birthday = vm.user.birthday
                number = vm.user.phone
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
                        Text("User Details")
                            .foregroundColor(.white)
                            .font(.system(size: 32, weight: .bold))
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .onAppear {
            completion()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UserInfoView(){}
}


class UserInfoViewModel: ObservableObject {
    
    @Published var user = User()
    
    
    func fetchUser() {
        user = StorageManager.shared.getUser()
    }
}
