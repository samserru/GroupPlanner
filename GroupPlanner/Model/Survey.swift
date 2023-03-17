//
//  Survey.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/13/23.
//

import Foundation

class Survey: ObservableObject, Identifiable{
     @Published var name: String = ""
    @Published var activities: [Activities]
     @Published var id: UUID = UUID()
    @Published var user: UserInfo = UserInfo()
    
    init(name: String = "", activities: [Activities] = [Activities()]){
        self.name = name
        self.activities = activities
    }
}

