//
//  SignUpView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//


import SwiftUI
import FirebaseAuth
import UserNotifications



struct SignupView: View {
    
    
    
    @EnvironmentObject var dataManager: DataManager
    
    @EnvironmentObject var userInfo: UserInfo
    
    @Binding var viewState: ViewState
    
    
    
    var body: some View {
        
        
        
        
        
        ZStack{
            
            
            
            VStack {
                Spacer()
             
                
                
                
                Image("logo")
                
                    .resizable()
                
                    .frame(width: 215, height: 200)
                
                    .clipShape(Circle())
                
                    .overlay(Circle().stroke(Color.highlight, lineWidth: 5))
                
                    .shadow(color: Color.white, radius: 10)
                
                    .padding(25)
               
                Spacer()
                
                
                
                
                
                
                TextField("user name or email", text: $userInfo.username)
                
                    .font(.headline)
                
                    .foregroundColor(.font)
                
                    .padding()
                
                    .frame(width: 300, height: 50)
                
                    .background(Color.gray.opacity(0.1))
                
                    .cornerRadius(15.0)
                
                
                
                
                SecureField("password", text: $userInfo.password)
                
                    .font(.headline)
                
                    .foregroundColor(.font)
                
                    .padding()
                
                    .frame(width: 300, height: 50)
                
                    .background(Color.gray.opacity(0.1))
                
                    .cornerRadius(15.0)
                
                    .padding()
                
                
                
                TextField("username", text: $userInfo.realName)
                
                    .font(.headline)
                
                    .foregroundColor(.font)
                
                    .padding()
                
                    .frame(width: 300, height: 50)
                
                    .background(Color.gray.opacity(0.1))
                
                    .cornerRadius(15.0)
                
                   
                
                
                
                
                
                Spacer()
                
                Button {
                    
                    
                    
                    dataManager.addUser(real: userInfo.realName)
                    
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
                    
                    
                    
                    
                    
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        
                        if success {
                            
                            print("All set!")
                            
                        } else if let error = error {
                            
                            print(error.localizedDescription)
                            
                        }
                        
                    }
                    
                    
                    
                } label: {
                    
                    Text("Sign up")
                    
                        .foregroundColor(Color.white)
                    
                        .frame(width: 200, height: 50)
                    
                        .background(Color.highlight)
                    
                        .cornerRadius(15)
                    
                }.padding()
                
                Spacer()
                
                Button {
                    
                    viewState = .login
                    
                } label: {
                    
                    Text("already have an account?")
                    
                        .foregroundColor(Color.black)
                    
                        .frame(width: 300, height: 50)
                    
                        .background(Color.white.opacity(0.1))
                    
                        .cornerRadius(20)
                    
                }.padding()
                
                
                
                
                
                
                
                
            }
            
            
            
        }.edgesIgnoringSafeArea(.all)
        
            .background(
                
                LinearGradient(gradient: Gradient(colors: [.white, .white]), startPoint: .top, endPoint: .bottom)
                
                
                
                
                
            )
        
    }
    
}



struct SignupView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignupView(viewState: Binding.constant(.signUp))
        
            .environmentObject(UserInfo())
        
            .environmentObject(DataManager())
        
    }
    
}

