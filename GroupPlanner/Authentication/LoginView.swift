import SwiftUI

import FirebaseAuth

struct LoginView: View {

    

    

    @EnvironmentObject var userInfo: UserInfo

    @Binding var viewState: ViewState

    

    var body: some View {

        ZStack{

            VStack {

//                Button {
//
//                    viewState = .authentication
//
//                } label: {
//
//                    Text("<<back")
//
//
//                        .foregroundColor(.black)
//
//                        .multilineTextAlignment(.leading)
//                        .padding(.trailing, 40.0)
//
//                        .frame(width: 100, height: 50)
//
//
//
//
//                }.padding()
                Spacer()

                

                Image("logo")
                
                    .resizable()
                
                    .frame(width: 215, height: 200)
                
                    .clipShape(Circle())
                
                    .overlay(Circle().stroke(Color.highlight, lineWidth: 5))
                
                    .shadow(color: Color.white, radius: 1)
                
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

                   

                }
               
            
            label: {

                    Text("Login")
                    
                    
                        .foregroundColor(Color.white)
                    
                        .frame(width: 200, height: 50)
                    
                        .background(Color.highlight)
                    
                        .cornerRadius(15)
                    

                }.padding()
                
                

                Button{
                    viewState = .authentication
                }label: {

                    Text("Back")
                    
                    
                        .foregroundColor(Color.white)
                    
                        .frame(width: 200, height: 50)
                    
                        .background(Color.highlight)
                    
                        .cornerRadius(15)
                    
                
                }.padding()

                Button {

                    viewState = .forgotPassword

                } label: {

                    Text("forgot password")

                        
                        .foregroundColor(Color.black)
                    
                        .frame(width: 300, height: 50)

                        .background(Color.white.opacity(0.8))

                        .cornerRadius(20)

                }.padding()

              

                

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



