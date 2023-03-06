//
//  LoginView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blue.opacity(0.6))
            
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                TextField("user name or email", text: $userInfo.username)

                    .padding()
                SecureField("password", text: $userInfo.password)
                   
                    .padding()
                
                Button {
                    Auth.auth().signIn(withEmail: userInfo.username, password: userInfo.password){
                        user, error in
                        if let _ = user{
                            viewState = .list
                            userInfo.loggedIn = true
                        }
                        else{
                            print(error?.localizedDescription)
                        }
                    }
                   
                } label: {
                    Text("Login")
                        
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                
                Button {
                    viewState = .authentication
                } label: {
                    Text("<<back")
                        
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                Spacer()
               
                Button {
                    viewState = .forgotPassword
                } label: {
                    Text("forgot password")
                        
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(.login))
            .environmentObject(UserInfo())
    }
}
