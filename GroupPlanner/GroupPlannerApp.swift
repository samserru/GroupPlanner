//
//  GroupPlannerApp.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/1/23.
//

import SwiftUI

import FirebaseCore



class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()



    return true

  }

}



@main

struct GroupPlannerApp: App {

    

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

   

    @StateObject var userInfo: UserInfo = UserInfo()

    @StateObject var datamanager: DataManager = DataManager()

    @StateObject var surveyList: SurveyList = SurveyList()

    @StateObject var myfriends: myFriends = myFriends()

    @StateObject var addsurveyfriends: addSurveyFriends = addSurveyFriends()



    



    

    var body: some Scene {

        WindowGroup {

            ContentView()

                .environmentObject(userInfo)

                .environmentObject(datamanager)

                .environmentObject(surveyList)

                .environmentObject(myfriends)

                .environmentObject(addsurveyfriends)



        }

    }

}
