//
//  AuthenticationView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//

import SwiftUI
struct AuthenticationView: View {
   
    @Binding var viewState: ViewState
    var body: some View {
        ZStack{
          Rectangle()
                .foregroundColor(Color.white)
                
            VStack {
               Spacer()
               
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
               
                Spacer()
                
                Button {
                    viewState = .signUp
                } label: {
                    Text("Signup")
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .background(Color.highlight)
                        .cornerRadius(30)
                }
               
                Button {
                    viewState = .login
                } label: {
                    Text("Login")
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .background(Color.highlight)
                        .cornerRadius(30)
                }
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authentication))
    }
}
