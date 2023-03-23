//
//  Time.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/15/23.
//

import Foundation

class times: ObservableObject, Identifiable{
    @Published var time: String = ""
    @Published var timeLikes: Int = 0
    @Published var timeLike: Bool = false
    
    init(time: String = "", timesLikes: Int = 0, timeLike: Bool = false){
        self.time = time
        self.timeLikes = timeLikes
        self.timeLike = timeLike
    }
}

class dates: ObservableObject, Identifiable{
    @Published var date: String = ""
    @Published var dateLikes: Int = 0
    @Published var dateLike: Bool = false
    
    init(date: String = "", dateLikes: Int = 0, dateLike: Bool = false){
        self.date = date
        self.dateLikes = dateLikes
        self.dateLike = dateLike
    }
}
