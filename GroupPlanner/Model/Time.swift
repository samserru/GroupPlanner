//
//  Time.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/15/23.
//

import Foundation


class timesList: ObservableObject, Identifiable{
    @Published var date: Date = Date()
    @Published var timeLikes: Int = 0
    @Published var timeLike: Bool = false
    @Published var id: UUID = UUID()
    
    init(date: Date, timeLikes: Int = 0, timeLike: Bool = false) {
         self.date = date
         self.timeLikes = timeLikes
         self.timeLike = timeLike
     }
 }

class dates: ObservableObject, Identifiable{
    @Published var date: Date = Date()
    @Published var timesList: [timesList] = []
    @Published var dateLikes: Int = 0
    @Published var dateLike: Bool = false
    @Published var id: UUID = UUID()
    
    init(date: Date = Date(), timesList: [timesList] = [], dateLikes: Int = 0, dateLike: Bool = false){
        self.date = date
        self.timesList = timesList
        self.dateLikes = dateLikes
        self.dateLike = dateLike
    }
}
