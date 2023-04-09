//
//  Survey.swift
//  GroupPlanner
//
//  Created by Joshua Greenberg (student LM) on 3/13/23.
//

import Foundation
import SwiftUI

class Survey: ObservableObject, Identifiable{
    @Published var name: String = ""
    @Published var activities: [Activities]
    @Published var id: UUID = UUID()
    @Published var user: UserInfo = UserInfo()
    @Published var mostPopularActivity: Activities? = nil {
          didSet {
              if let activity = mostPopularActivity {
                  let content = UNMutableNotificationContent()
                  content.title = "Most Popular Activity"
                  content.body = "\(activity.name) is now the most popular activity."
                  content.sound = UNNotificationSound.default

                  // Trigger the notification to be shown in 5 seconds
                  let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                  // Create a request to show the notification
                  let request = UNNotificationRequest(identifier: "MostPopularActivityNotification", content: content, trigger: trigger)

                  // Add the request to the notification center
                  UNUserNotificationCenter.current().add(request) { error in
                      if let error = error {
                          print("Error sending notification: \(error.localizedDescription)")
                      }
                  }
              }
          }
      }
    
    init(name: String = "", activities: [Activities] = [Activities()]){
        self.name = name
        self.activities = activities
    }
    
    
func findMostPopularActivity() -> (activity: Activities, date: dates, time: timesList)? {
    // Find the activity with the most likes
    guard let mostLikedActivity = activities.max(by: { $0.totalActivityLikes < $1.totalActivityLikes }) else {
        // Return nil if there are no activities in the survey
        return nil
    }
    
    // Find the date and time with the most likes for the most popular activity
    guard let mostLikedDate = mostLikedActivity.datesList.max(by: { $0.dateLikes < $1.dateLikes }),
          let mostLikedTime = mostLikedDate.timesList.max(by: { $0.timeLikes < $1.timeLikes }) else {
        // Return nil if there are no dates or times associated with the most popular activity
        return nil
    }
    
    // Return a tuple containing the most popular activity, date, and time
    return (activity: mostLikedActivity, date: mostLikedDate, time: mostLikedTime)
}
    func updateMostPopularActivity() {
           // Determine the most popular activity
           if let mostLikedActivity = activities.max(by: { $0.totalActivityLikes < $1.totalActivityLikes }) {
               mostPopularActivity = mostLikedActivity
           } else {
               mostPopularActivity = nil
           }
       }

}

