import SwiftUI



struct BaseView: View {

    @EnvironmentObject var userInfo: UserInfo

    @Binding var viewState: ViewState

    

    var body: some View {

        TabView{

            

            

            CalendarView(x: $userInfo.realName)

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
                        

                    Text("Poll")

                }

            

            

            SettingsView(viewState: $viewState)

                .tabItem{

                    Image(systemName: "gear")
                    

                    Text("Settings")

                }

        } .accentColor(.highlight)

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



                
