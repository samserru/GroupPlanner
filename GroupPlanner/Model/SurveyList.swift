//
//  SurveyList.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/15/23.
//

import Foundation

class SurveyList: ObservableObject{
    @Published var surveyList: [Survey]
    
    init(surveyList: [Survey] = [Survey()]){
        self.surveyList = surveyList
    }
}
