//
//  SettingsView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/6/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    var body: some View {
        Button{
           
            viewState = .authentication
            userInfo.loggedIn = false
        } label: {
            Text("<< back")
            
                .padding(.trailing, 200)
        }
}
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.settings))
    }
}
