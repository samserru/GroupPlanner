//
//  ContentView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/1/23.
//



import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @State var viewState: ViewState = .authentication
    
    var body: some View {
        if viewState == .authentication && !userInfo.loggedIn{
            AuthenticationView(viewState: $viewState)
        } else if viewState == .login && !userInfo.loggedIn{
            LoginView(viewState: $viewState)
        }else if viewState == .signUp && !userInfo.loggedIn{
            SignupView(viewState: $viewState)
        } else if viewState == .forgotPassword && !userInfo.loggedIn{
            ForgotPassword(viewState: $viewState)
        }else{
            
            Button{
                viewState = .authentication
            } label: {
                Text("<< back")
                
                    .padding(.trailing, 200)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
