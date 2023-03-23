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
    @State private var date = Date()
    @State private var currentDate = Date()
    @State var image1: String = "minus.square"
    @State var image2: String = "minus.square"
    @State var image3: String = "minus.square"
    
    var body: some View {
        ZStack{
            
            TextField("Survey name", text: $survey.name)
                .padding()
            
            VStack{
                List{
                    
                    
                    ForEach(survey.activities.indices){ a in
                        ScrollView{
                            HStack{
                                TextField("Activity Name", text: $survey.activities[a].name)
                                
                                
                                Button{
                                    if  survey.activities[a].activityLike==false{
                                        survey.activities[a].activityLike=true
                                        survey.activities[a].totalActivityLikes += 1
                                        image1 = "checkmark.square.fill"
                                    }
                                    
                                    else{
                                        image1 = "minus.square"
                                        survey.activities[a].activityLike = false
                                        survey.activities[a].totalActivityLikes -= 1
                                    }
                                } label: {
                                    
                                    Image(systemName: image1)
                                    
                                }
                                Text("\(survey.activities[a].totalActivityLikes)")
                                    .padding()
                            }
                            
                        }
                        HStack{
                            VStack{
                                Button{
                                    if survey.activities[a].datesList[a].dateLike==false{
                                        survey.activities[a].datesList[a].dateLike=true
                                        survey.activities[a].datesList[a].dateLikes += 1
                                        image2 = "checkmark.square.fill"
                                    }
                                    else{
                                        survey.activities[a].datesList[a].dateLikes -= 1
                                        survey.activities[a].datesList[a].dateLike=false
                                        image2 = "minus.square"
                                    }
                                } label: {
                                    VStack{
                                        HStack{
                                            TextField("Date", text: $survey.activities[a].datesList[a].date)
                                            
                                            Spacer()
                                            Image(systemName: image2)
                                            
                                        }
                                    }
                                }
                            }
                            
                        
                        Text("\(survey.activities[a].datesList[a].dateLikes)")
                            .padding()
                    }
                    
                    DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    //                    Button{
                    //
                    //
                    //                    } label: {
                    //                        HStack{
                    //                            Image(systemName: "calendar.badge.plus")
                    //                            Spacer()
                    //                        }
                    //                    }
                    
                    HStack{
                        Button{
                            if survey.activities[a].timesList[a].timeLike==false{
                                survey.activities[a].timesList[a].timeLike=true
                                survey.activities[a].timesList[a].timeLikes += 1
                                image3 = "checkmark.square.fill"
                            }
                            else{
                                survey.activities[a].timesList[a].timeLikes -= 1
                                survey.activities[a].timesList[a].timeLike=false
                                image3 = "minus.square"
                            }
                            
                        } label: {
                            HStack{
                                TextField("Time", text: $survey.activities[a].timesList[a].time)
                                Spacer()
                                Image(systemName: image3)
                                
                            }
                        }
                        Text("\(survey.activities[a].timesList[a].timeLikes)")
                            .padding()
                    }
                        
                               VStack {
                                   DatePicker("Time", selection: $currentDate, displayedComponents: .hourAndMinute)
                                   .labelsHidden()
                               }
                           
//                    Button{
//                        //add time
//                    } label: {
//                        Image(systemName: "clock")
//                    }
                    
                    Button{
                        survey.activities.append(Activities())
                    } label: {
                        Text("Add Activity")
                        Image(systemName: "plus")
                    }
                    
                }
            }
            
            
            
            
        }
        VStack{
            Spacer()
            Button{
                //                        $surveyList.append($survey)
            } label: {
                Text("Send Survey")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.highlight)
                    .cornerRadius(30)
            }
        }
    }
}
}


struct CreateSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSurveyView()
    }
}
