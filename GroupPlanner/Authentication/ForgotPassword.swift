//
//  ForgotPassword.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//


import SwiftUI
import FirebaseAuth
struct ForgotPassword: View {
   
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
   
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
            
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
                    Auth.auth().sendPasswordReset(withEmail: userInfo.username) { _ in
                        self.viewState = .authentication
                    }
    
                    
                } label: {
                    Text("Reset password")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.highlight)
                        .cornerRadius(30)
                }.padding()
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(viewState: Binding.constant(.forgotPassword))
            .environmentObject(UserInfo())
    }
}

