//
//  Time.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/15/23.
//

import Foundation

class times: ObservableObject, Identifiable{
    @Published var time: String = ""
    @Published var timesLikes: Int = 0
    @Published var timeLike: Bool = false
}

class dates: ObservableObject, Identifiable{
    @Published var date: String = ""
    @Published var dateLikes: Int = 0
    @Published var dateLike: Bool = false
}
