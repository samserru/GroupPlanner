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
    @Published var times: [times] = []
    @Published var dates: [dates] = []
    @Published var activityLike: Bool = false
    @Published var totalActivityLikes: Int = 0
}

