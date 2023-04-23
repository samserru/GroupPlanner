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
    @Published var date: Date = Date()
    @Published var isExpired: Bool = false

    var dateString: String {

       let formatter = DateFormatter()

       formatter.dateFormat = "MMMM dd, EEEE"

       return formatter.string(from: date)

   }

    
    init(name: String = "", activities: [Activities] = [Activities()],date: Date = Date()){
        self.name = name
        self.activities = activities
        self.date = date
    }
    


    
    
    
    
    
    func scheduleExpirationNotification(timeIntervals: Double) {
        // Create a notification content
        let content = UNMutableNotificationContent()
        content.title = "Survey Expired"
        content.body = "The survey \(name) has expired."
        content.sound = UNNotificationSound.default
        
        // Calculate the time interval between now and the expiration date
//        let now = Date()
//        let diffComponents = Calendar.current.dateComponents([.day, .hour, .minute], from: now, to: date)
//        let days = Double(diffComponents.day!)*86400.0
//        let hours = Double(diffComponents.hour!)*3600.0
//        let minutes = Double(diffComponents.minute!)*60.0
//        let timeInterval = days+hours+minutes
     
        // Schedule the notification to be shown when the survey expires
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeIntervals, repeats: false)
           let request = UNNotificationRequest(identifier: id.uuidString, content: content, trigger: trigger)
      
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                // Set the survey name to the first activity in the survey when it expires
                DispatchQueue.main.asyncAfter(deadline: .now() + timeIntervals) {
                               
                    print("\(self.date)")
                    
                    
                    self.isExpired = true
                   
                               print("Survey \(self.id) expired, name changed to \(self.name)")
                
                }
            }
        }
        
        
        
    }
    
    
    
    
    func checkIfExpired() -> Bool{
        let now = Date()
        if now > self.date {
            return true
        } else {
            return false
        }
    }
    
    
}


