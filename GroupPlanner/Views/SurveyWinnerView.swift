import SwiftUI

import Foundation



struct SurveyWinnerView: View {

    @Binding var survey: Survey

    @EnvironmentObject var datamanager: DataManager

    @EnvironmentObject var userInfo: UserInfo

    //@State var act: Activities

    var body: some View {

        ZStack{
            VStack{
                Text("")
                Spacer()
            Text(survey.mostLikedActivity().name)
                    .padding()

            Text(survey.mostLikedActivity().description)
                    .padding()

            Text(survey.mostLikedActivity().dateString)
                    .padding()

            Text("\(survey.mostLikedActivity().totalActivityLikes)")
                    .padding()
            Spacer()
                Text("")

                ForEach(datamanager.activities) { activity in
                

                        if(activity.totalActivityLikes < survey.mostLikedActivity().totalActivityLikes){


                        VStack{
                            HStack{
                            Text(activity.name)

                                .padding()
                                
                                Text("\(activity.totalActivityLikes)")
                            }
                            HStack{
                                Text("")
                                Spacer()
                                Text("")
                            }
                            }
                        
                        }

                    }
                }

            .navigationTitle(survey.name)
           

            .onAppear(){
                self.datamanager.fetchActivities(real: userInfo.realName, s: survey.name)
            }
        }.background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
              .edgesIgnoringSafeArea(.all))
        }
        }




struct SurveyWinnerView_Previews: PreviewProvider {

    static var previews: some View {

        SurveyWinnerView(survey: Binding.constant(Survey(name:"Test", activities: [Activities()])))

            .environmentObject(DataManager())

            .environmentObject(UserInfo())



    }

}

