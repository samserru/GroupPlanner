//
//  Activities.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/15/23.
//

import Foundation


class Activities: ObservableObject, Identifiable{
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var timesList: [times] = []
    @Published var datesList: [dates] = []
    @Published var date: Date = Date()
//    @Published var time: Time = 
    @Published var activityLike: Bool = false
    @Published var totalActivityLikes: Int = 0
    @Published var id: UUID = UUID()
    
    init(name: String = "", description: String = "", timesList: [times] = [times()], datesList: [dates] = [dates()], activityLike: Bool = false, totalActivityLikes: Int = 0, date: Date = Date()){
        self.name = name
        self.timesList = timesList
        self.datesList = datesList
        self.date = date
        self.activityLike = activityLike
        self.totalActivityLikes = totalActivityLikes
    }
}

