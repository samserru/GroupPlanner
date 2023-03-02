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
                .foregroundColor(.blue.opacity(0.6))
                
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
                        
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
               
                Button {
                    viewState = .login
                } label: {
                    Text("Login")
                        
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(20)
                }.padding()
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
