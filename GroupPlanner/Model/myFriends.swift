//
//  myFriends.swift
//  GroupPlanner
//
//  Created by Nathan Grunfeld (student LM) on 3/24/23.
//

import SwiftUI

import Foundation

class myFriends: ObservableObject, Identifiable{
    @Published var myFriends: [String]
    
    init(myFriends: [String] = []){
        self.myFriends = myFriends
    }
}
