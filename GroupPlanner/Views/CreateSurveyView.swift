//
//  SurveyView.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/6/23.
//

import SwiftUI
import Firebase

struct CreateSurveyView: View {
    @EnvironmentObject var surveyList: SurveyList
    @State private var surveyName = ""
    @State private var activities: [Activities] = [Activities()]
    
    var body: some View {
        VStack {
            TextField("Survey name", text: $surveyName)
                .padding()
            
            List {
                ForEach($activities) { $activity in
                    Section(header: Text("Activity")) {
                        TextField("Activity Name", text: $activity.name)
                        
                        DatePicker(
                            "Date",
                            selection: $activity.date,
                            displayedComponents: [.date]
                        )
                        
                        DatePicker(
                            "Time",
                            selection: $activity.date,
                            displayedComponents: .hourAndMinute
                        )
                    }
                }
                .onDelete { indexSet in
                    activities.remove(atOffsets: indexSet)
                }
            }
            
            HStack {
                Button(action: {
                    activities.append(Activities())
                }, label: {
                    Image(systemName: "plus")
                })
                
                Button(action: {
                    let newSurvey = Survey(name: surveyName, activities: activities)
                    surveyList.surveyList.append(newSurvey)
                    
                }, label: {
                    Text("Create")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.highlight)
                        .cornerRadius(30)
                })
            }
        }
    }
}

struct CreateSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSurveyView()
    }
}
