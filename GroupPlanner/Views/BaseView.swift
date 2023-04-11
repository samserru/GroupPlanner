//
//  BaseView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/6/23.
//

import SwiftUI

struct BaseView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        TabView{
            
            
           CalendarView()
               .tabItem{
                   Image(systemName: "calendar")
                   Text("Calendar")
              }
            
           FriendView()
               .tabItem{
                    Image(systemName: "person")
                    Text("Friends")
               }
            
            
            CreateSurveyView()
                .tabItem{
                    Image(systemName: "circle")
                    Text("Survey")
                }
            
            
           // SettingsView(viewState: $viewState)
               // .tabItem{
                //    Image(systemName: "gear")
                  //  Text("settings")
                }
       // }
    }
}
    struct BaseView_Previews: PreviewProvider {
        static var previews: some View {
            BaseView(viewState: Binding.constant(.base))
                .environmentObject(UserInfo())
                .environmentObject(DataManager())
                .environmentObject(SurveyList())
        }
                     }

