import SwiftUI

import Foundation



struct SurveyDetailView: View {

    @Binding var survey: Survey

    @EnvironmentObject var datamanager: DataManager

    @EnvironmentObject var userInfo: UserInfo

    //@State var act: Activities

    var body: some View {

        ZStack{

            List {

                ForEach(datamanager.activities) { activity in

                    Section(header: Text(activity.name)) {

                        VStack{

                            Text(activity.dateString)

                                .padding()
                            Button{
                                              if activity.activityLike == false {
                                                  activity.activityLike = true
                                                  activity.totalActivityLikes += 1
                                              }
                                              else{
                                                  activity.activityLike = false
                                                  activity.totalActivityLikes -= 1
                                              }
                                
                                datamanager.addActivity(s: userInfo.realName, real: survey.name, act: activity)
                                       
                            
                            } label: {
                                              if activity.activityLike == false {
                                                  Image(systemName: "rectangle")
                                              }
                                              else{
                                                  Image(systemName: "checkmark.rectangle.fill")
                                              }
                                          }
                            
                            

                            }
                        }

                    }
                }

            .navigationTitle(survey.name)

            .onAppear(){
                self.datamanager.fetchActivities(real: userInfo.realName, s: survey.name)
            }
        }
    }

}


struct SurveyDetailView_Previews: PreviewProvider {

    static var previews: some View {

        SurveyDetailView(survey: Binding.constant(Survey(name:"Test", activities: [Activities()])))

            .environmentObject(DataManager())

            .environmentObject(UserInfo())



    }

}

