//
//  SurveyView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/6/23.
//

import SwiftUI

struct CreateSurveyView: View {
    @EnvironmentObject var surveyList: SurveyList
    @State var survey: Survey = Survey()
    @State var image1: String = "minus.square"
    //    @State var surveyName: String = ""
    //    @State var activities: [activities] = []
    
    var body: some View {
        
        
        VStack{
            List{
                //ForEach(data: activities)i in
                
                
                TextField("Survey name", text: $survey.name)
                
                
                ScrollView{
                    
                    HStack{
                        
                        TextField("Activity Name", text: $survey.activities[0].name)
                            .padding()
                        
                        Button{
                            if  survey.activities[0].activityLike==false{
                                survey.activities[0].activityLike=true
                                survey.activities[0].totalActivityLikes += 1
                                image1 = "checkmark.square.fill"
                            }
                            
                            else{
                                image1 = "minus.square"
                                survey.activities[0].activityLike = false
                                                           survey.activities[0].totalActivityLikes -= 1
                             }
                        } label: {
                            
                            Image(systemName: image1)
                            
                        }
                        Text("\(survey.activities[0].totalActivityLikes)")
                                                                            .padding()
                    }
                    
                    
                    
                    
                    
                }
                
                Button{
                    if survey.activities[0].dates[0].dateLike==false{
                        survey.activities[0].dates[0].dateLike=true
                    }
                } label: {
                    TextField("Date", text: $survey.activities[0].dates[0].date)
                    Text("Add Date")
                    Image(systemName: "calendar.badge.plus")
                }
                
                Button{
                    //add time
                } label: {
                    Text("Add Time")
                    Image(systemName: "clock")
                }
            }
            Button{
                
                
            } label: {
                Text("Add Activity")
                Image(systemName: "plus")
            }
            
        }
    }
}



struct CreateSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSurveyView()
    }
}
