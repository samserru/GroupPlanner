import SwiftUI

import Foundation



struct SurveyDetailView: View {

    @Binding var survey: Survey

    @EnvironmentObject var datamanager: DataManager

    @EnvironmentObject var userInfo: UserInfo
    
    

  

    var body: some View {

        ZStack{

            List {

                ForEach(datamanager.activities) { activity in

                    Section(header: Text(activity.name)) {

                        HStack{

                            Text(activity.dateString)
                            Text(activity.description)

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
                                

                            
                            } label: {

                            
                                if activity.activityLike == false {
                                                  Image(systemName: "rectangle")
                                              }
                                              else{
                                                  Image(systemName: "checkmark.rectangle.fill")
                                              }
                                          }
                            Text("\(activity.totalActivityLikes)")
                         

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

