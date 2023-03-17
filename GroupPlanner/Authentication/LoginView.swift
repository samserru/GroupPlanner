
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
                    .padding()
                
                SecureField("password", text: $userInfo.password)
                    .padding()
                
                
            
               
                Button {
                    viewState = .forgotPassword
                } label: {
                    Text("forgot password")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.highlight)
                        .cornerRadius(30)
                }
                
                
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
                                        .foregroundColor(Color.white)
                                        .frame(width: 200, height: 50)
                                        .background(Color.highlight)
                                        .cornerRadius(30)
                                }
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
