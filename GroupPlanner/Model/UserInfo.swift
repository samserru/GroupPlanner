//
//  UserInfo.swift
//  GroupPlanner
//
//  Created by Samuel Serruya (student LM) on 3/2/23.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


class UserInfo: ObservableObject, Identifiable{
    @Published var realName: String
    @Published var username: String
    @Published var password: String
    @Published var loggedIn: Bool = false
    @Published var id: String
    @Published var image: UIImage = UIImage(named: "default")!
    @Published var imageURL: String
  //  @Published var surveys: Survey = Survey()

    
    
    init(username: String = "", password: String = "", realName: String = "", loggedIn: Bool = false, id: String = ""){
        self.username=username
        self.password=password
        self.realName=realName
        self.loggedIn = false
        self.id = id
        
       // self.surveys=survey
        
        self.imageURL = ""
        
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
            
            self.username = user.email ?? ""
            self.loggedIn = true
        }
        
        var dictionary: [String: Any]{
            ["image": imageURL]
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        Database.database().reference().child("users/\(uid)").observeSingleEvent(of: .value)
        { snapshot in
            let dictionary = snapshot.value as? [String: AnyObject] ?? [:]
            
            self.imageURL = dictionary["image"] as? String ?? self.imageURL
            
            Storage.storage().reference(forURL: self.imageURL).getData(maxSize: 1*2048*2048) { data, error in
                if let data = data{
                    self.image = UIImage(data: data) ?? self.image
                } else{
                    print(error?.localizedDescription)
                }
            }
        }
    }
}

