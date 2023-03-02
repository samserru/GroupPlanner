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
                       
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewState: Binding.constant(.list))
    }
}
