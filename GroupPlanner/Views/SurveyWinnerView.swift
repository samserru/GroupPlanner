import SwiftUI

import Foundation



struct SurveyWinnerView: View {

    @Binding var survey: Survey

    @EnvironmentObject var datamanager: DataManager

    @EnvironmentObject var userInfo: UserInfo

    //@State var act: Activities

    var body: some View {

        ZStack{
            Rectangle()
                            .foregroundColor(Color.green)
                            .edgesIgnoringSafeArea(.all)
            VStack{
                Text("")
                Spacer()
            Text(datamanager.mostLikedActivity().name)
                    .fontWeight(.heavy)
                    .padding()
                    .font(.title)
                    .foregroundColor(Color.white)

                Text(datamanager.mostLikedActivity().description)
                    .fontWeight(.heavy)
                    .padding()
                    .font(.title)
                    
                    .foregroundColor(Color.white)



            Text(datamanager.mostLikedActivity().dateString)
                    .fontWeight(.heavy)

                    .padding()
                    .font(.title)
                    .foregroundColor(Color.white)



            Text("\(datamanager.mostLikedActivity().totalActivityLikes)")
                    .fontWeight(.heavy)
                    .padding()
                    .font(.title)
                    .foregroundColor(Color.white)


            Spacer()
                Text("")

//                ForEach(datamanager.activities) { activity in
//
//
//                        if(activity.totalActivityLikes < survey.mostLikedActivity().totalActivityLikes){
//
//
//                        VStack{
//                            HStack{
//                            Text(activity.name)
//
//                                .padding()
//
//                                Text("\(activity.totalActivityLikes)")
//                            }
//                            HStack{
//                                Text("")
//                                Spacer()
//                                Text("")
//                            }
//                            }
//
//                        }
//
//                    }
                }

            .navigationTitle(survey.name)
           

            .onAppear(){
                self.datamanager.fetchActivities(real: userInfo.realName, s: survey.name)
            }
        }
        //.background(
            //LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
             // .edgesIgnoringSafeArea(.all))
        }
        }




struct SurveyWinnerView_Previews: PreviewProvider {

    static var previews: some View {

        SurveyWinnerView(survey: Binding.constant(Survey(name:"Test", activities: [Activities()])))

            .environmentObject(DataManager())

            .environmentObject(UserInfo())



    }

}

