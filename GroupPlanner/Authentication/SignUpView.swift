//
//  SignUpView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//


import SwiftUI
import FirebaseAuth

struct SignupView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                Button {
                    viewState = .authentication
                } label: {
                    Text("back")
                        .frame(width: 300, height: 50, alignment: .leading)
                        .foregroundColor(.highlight)
//                        .edgesIgnoringSafeArea(.all)
                }
                }
            
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                TextField("user name or email", text: $userInfo.username)
                    .foregroundColor(.font)
                    .padding()
                SecureField("password", text: $userInfo.password)
                    .foregroundColor(.font)
                    .padding()
                
                Button {
                   
                    Auth.auth().createUser(withEmail: userInfo.username, password: userInfo.password){
                        
                        user, error in
                        if let _ = user{
                            print("success")
                            viewState = .list
                            userInfo.loggedIn = true
                        }
                        else{
                            print(error.debugDescription)
                        }
                    }
                    
                    
                    
                    
                } label: {
                    Text("Sign up")
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .background(Color.highlight)
                        .cornerRadius(30)
                }.padding()
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewState: Binding.constant(.list))
            .environmentObject(UserInfo())
    }
}
