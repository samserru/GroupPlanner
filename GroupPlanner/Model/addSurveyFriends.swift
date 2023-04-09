//
//  addSurveyFriends.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/27/23.
//

import SwiftUI

import Foundation

class addSurveyFriends: ObservableObject, Identifiable{
    @Published var addsurveyfirends: [String]
    
    init(addsurveyfriends: [String] = []){
        self.addsurveyfirends = addsurveyfriends
    }
}
