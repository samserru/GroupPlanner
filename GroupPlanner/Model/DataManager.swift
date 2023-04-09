import SwiftUI

import Firebase

import FirebaseFirestore



class DataManager: ObservableObject{

    @Published var userInfos: [UserInfo] = []

    @Published var u:[String] = []

    

    init(){

        fetchuserInfo()

    }

    

    func fetchuserInfo(){

        userInfos.removeAll()

        let db = Firestore.firestore()

        let ref = db.collection("UserInfo")

        ref.getDocuments { snapshot, error in

            guard error == nil else{

                print(error!.localizedDescription)

                return

            }

            

            if let snapshot = snapshot{

                for document in snapshot.documents{

                    let data = document.data()

                    

                    let id = data["id"] as? String ?? ""

                    let realName = data["realName"] as? String ?? ""

                    let username = data["username"] as? String ?? ""

                    let password = data["password"] as? String ?? ""

                    let loggedIn = data["loggedIn"] as? Bool ?? false

                //    let survey = data["survey"] as? Survey ?? Survey()

                    

                    let userinfo = UserInfo(username: username, password: password, realName: realName, loggedIn: loggedIn, id: id)

                    //survey: survey

                    self.userInfos.append(userinfo)

                    self.u.append(realName)

                }

            }

        }

    }

    

    func addUser(real: String){

        let db = Firestore.firestore()

        let ref = db.collection("UserInfo").document(real)

        //, "survey": Survey()

        ref.setData(["realName": real, "id": "\(Int.random(in: 1..<1000))", "username": "", "password": "", "loggedIn": false]){ error in

            if let error = error{

                print(error.localizedDescription)

            }

        }

    }

    

//    func addUserSurvey(s: Survey, r: String){

//        let db = Firestore.firestore()

//        let ref = db.collection("UserInfo").document(r)

//        ref.setData(["realName": r, "id": "\(Int.random(in: 1..<1000))", "username": "", "password": "", "loggedIn": false, "survey": s]){ error in

//            if let error = error{

//                print(error.localizedDescription)

//            }

//        }

//    }

    

}
