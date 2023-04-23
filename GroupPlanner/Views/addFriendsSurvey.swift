import SwiftUI



struct addFriendsSurvey: View {
    
    
    
    
    
    @EnvironmentObject var datamanager: DataManager
    
    @State private var searchText = ""
    
    @EnvironmentObject var myfriends: myFriends
    
    @EnvironmentObject var addsurveryfriends: addSurveyFriends
    
    @EnvironmentObject var userInfo: UserInfo
    
    
    @State private var selectedRow: String? = nil
    
    
    
    
    
    
    var body: some View {
        
        NavigationView{
            
            List{
                
                ForEach(datamanager.friends) { user in
                    
                    
                    //                    ForEach(r.r, id: \.self) {
                    //
                    //                    HStack{
                    //
                    //
                    //                        Button{
                    //                            addsurveryfriends.addsurveyfirends.append(user.myFriends)
                    //                            r.r.append(user.myFriends)
                    //                            r.r = user.myFriends
                    //                        } label: {
                    //                            Text(user.myFriends)
                    //                                .listRowBackground(Color.clear)
                    //                                .background(r.r == user.myFriends ? Color.green : Color.clear)
                    //                        }
                    
                    
                    Button{
                        
                        addsurveryfriends.addsurveyfirends.append(user.myFriends)
                        
                    } label: {
                        
                        Text(user.myFriends)
                            .listRowBackground(Color.green)
                        
                    }
                    
                    
                }
                
                //    }
                
            }
            
        }
        
        .searchable(text: $searchText)
        
        .navigationTitle("Add friends")
        
        
        
        
        
    }
    
    
    
}

//    var r: [String] {
//
//        //let n = myfriends.myFriends.map{ $0}
//
//        let n = userInfo.friends.map{ $0}
//
//
//
//
//
//        return searchText == "" ? n : n.filter{
//
//            $0.contains(searchText)
//
//        }
//
//    }

//}



struct addFriendsSurvey_Previews: PreviewProvider {
    
    static var previews: some View {
        
        addFriendsSurvey()
        
            .environmentObject(DataManager())
        
            .environmentObject(myFriends())
        
            .environmentObject(addSurveyFriends())
        
            .environmentObject(UserInfo())
        
        
        
    }
    
}

