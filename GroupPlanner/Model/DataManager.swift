import SwiftUI



import Firebase



import FirebaseFirestore







class DataManager: ObservableObject, Identifiable{

    @Published var userInfos: [UserInfo] = []

    @Published var u:[String] = []

    @Published var surveys = [Survey]()

    @Published var activities = [Activities]()

    @Published var datesAgain = [dates]()

    @Published var times = [timesList]()

    @Published var friends = [myFriends]()

    

    

    

    

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

                    

                    let friends = data["friends"] as? [String] ?? []

                    

                    //    let survey = data["survey"] as? Survey ?? Survey()

                    

                    

                    

                    let userinfo = UserInfo(username: username, password: password, realName: realName, loggedIn: loggedIn, id: id, friends: friends)

                    

                    //survey: survey

                    

                    self.userInfos.append(userinfo)

                    

                    self.u.append(realName)

                    

                }

                

            }

            

        }

        

    }

    

    
    func mostLikedActivity() -> Activities {
        var mostLiked: Activities = Activities(name: "No votes", description: "Sorry, no activities were liked was chosen", activityLike: true, totalActivityLikes: 0, date: Date())
        for activity in activities {
            if activity.totalActivityLikes >= mostLiked.totalActivityLikes {
                mostLiked = activity
            }
        }
        return mostLiked
    }

    

    func addUser(real: String){

        

        let db = Firestore.firestore()

        

        let ref = db.collection("UserInfo").document(real)

        

        //, "survey": Survey()

        

        ref.setData(["realName": real, "id": "\(Int.random(in: 1..<10000))", "username": "", "password": "", "loggedIn": false], merge: true){ error in

            

            if let error = error{

                

                print(error.localizedDescription)

                

            }

            

        }

        

    }

    

    

    

    func addFriends(real: String, n: String){

        

        let db = Firestore.firestore()

        

        let ref = db.collection("UserInfo").document(real).collection("friends").document(n)

        

        ref.setData(["name": n], merge: true){ error in

            

            if let error = error{

                

                print(error.localizedDescription)

                

            }

            

        }
    }

    func addUserSurvey(real: String, s: String, surv: Survey){
            
            let db = Firestore.firestore()
            
            
            
            let ref = db
            
                .collection("UserInfo")
            
                .document(real)
            
                .collection("survey")
            
                .document(s)
            
            ref.setData(["name": s, "date": surv.date], merge: true){ error in
                
                if let error = error{
                    
                    print(error.localizedDescription)
                    
                }
                
            }
            
        }


    func addActivity(s: String, real: String, act: Activities){

        let db = Firestore.firestore()

        let ref = db.collection("UserInfo").document(real).collection("survey").document(s).collection("activities").document(act.name)


        ref.setData(["name": act.name, "description":act.description, "activityLike":act.activityLike, "totalActivityLikes":act.totalActivityLikes, "date":act.date]){ error in

            

            if let error = error{

                

                print(error.localizedDescription)

                

            }

            

        }

        

    }

    

    

    

    func addDate(s: String, real: String, act: Activities, d: dates){

        

        let db = Firestore.firestore()

        

        let ref = db.collection("UserInfo").document(real).collection("survey").document(s).collection("activities").document(act.name).collection("dateList").document("\(d.rand)")

        

        ref.setData(["date":d.date, "dateLikes": d.dateLikes,"dateLike":d.dateLike,"rand":d.rand]){ error in

            

            if let error = error{

                

                print(error.localizedDescription)

                

            }

            

        }

        

    }

    

    

    

    func addTime(s: String, real: String, act: Activities, d:dates, t: timesList){

        

        let db = Firestore.firestore()

        

        let ref = db.collection("UserInfo").document(real).collection("survey").document(s).collection("activities").document(act.name).collection("dateList").document("\(d.rand)").collection("timesList").document("\(t.rand)")

        

        ref.setData(["date":t.date,"timeLikes":t.timeLikes,"timeLike":t.timeLike, "rand":t.rand]){ error in

            

            if let error = error{

                

                print(error.localizedDescription)

                

            }

            

        }

        

    }

    

    func fetchSurvey(real: String){

        let db = Firestore.firestore()

        

        let ref = db.collection("UserInfo").document(real).collection("survey").addSnapshotListener { (querySnapshot, error) in

            guard let documents = querySnapshot?.documents else{

                print("no documents")

                return

            }

            

            self.surveys = documents.map { (QueryDocumentSnapshot) -> Survey in

                let data = QueryDocumentSnapshot.data()

                let name = data["name"] as? String ?? ""

                let activities = data["activities"] as? [Activities] ?? []

                let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()

                

                

                   return Survey(name: name, activities: activities, date: date)

                

                            }

                        }

                    }

                    

                    func fetchActivities(real: String, s:String){

                        let db = Firestore.firestore()

                        

                        let ref = db.collection("UserInfo").document(real).collection("survey").document(s).collection("activities").addSnapshotListener { (querySnapshot, error) in

                            guard let documents = querySnapshot?.documents else{

                                print("no documents")

                                return

                            }

                            

                            self.activities = documents.map { (QueryDocumentSnapshot) -> Activities in

                                let data = QueryDocumentSnapshot.data()

                                

                                let activityLike = data["activityLike"] as? Bool ?? false

                                let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()

                               

                                let name = data["name"] as? String ?? ""

                                let totalActivityLikes = data["totalActivityLikes"] as? Int ?? 0

                                let description = data["description"] as? String ?? ""

                                

                                return Activities(name: name, description: description, activityLike: activityLike, totalActivityLikes: totalActivityLikes, date: date)

                            }

                            

                        }

                    }

    

                  

                    

                    func fetchTimes(real: String, s:String, act: String, d: dates){

                        let db = Firestore.firestore()

                        

                        let ref = db.collection("UserInfo").document(real).collection("survey").document(s).collection("activities").document(act).collection("dateList").document("\(d.rand)").collection("timesList").addSnapshotListener { (querySnapshot, error) in

                            guard let documents = querySnapshot?.documents else{

                                print("no documents")

                                return

                            }

                            

                            self.times = documents.map { (QueryDocumentSnapshot) -> timesList in

                                let data = QueryDocumentSnapshot.data()

                                

                                let timeLike = data["timeLike"] as? Bool ?? false

                                let date = data["date"] as? Date ?? Date()

                                let timesLikes = data["timesLikes"] as? Int ?? 0

                                 let rand = data["rand"] as? Int ?? 0

                                

                                return timesList(date: date, timesLikes: timesLikes, timeLike: timeLike)

                            }

                            

                        }

                    }

                    

                    func fetchFriends(real: String){

                        let db = Firestore.firestore()

                        

                        let ref = db.collection("UserInfo").document(real).collection("friends").addSnapshotListener { (querySnapshot, error) in

                            guard let documents = querySnapshot?.documents else{

                                print("no documents")

                                return

                            }

                            

                            self.friends = documents.map { (QueryDocumentSnapshot) -> myFriends in

                                let data = QueryDocumentSnapshot.data()

                                let name = data["name"] as? String ?? ""

                                

                                return myFriends(myFriends: name)

                                

                            }

                        }

                    }

                    

                    

                }

                

