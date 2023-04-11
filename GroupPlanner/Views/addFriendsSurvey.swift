import SwiftUI



struct addFriendsSurvey: View {

    

    

    @EnvironmentObject var datamanager: DataManager

    @State private var searchText = ""

    @EnvironmentObject var myfriends: myFriends

    @EnvironmentObject var addsurveryfriends: addSurveyFriends

    @EnvironmentObject var userInfo: UserInfo







    var body: some View {



        

        NavigationView{

            List{

                ForEach(r, id: \.self) { user in

                    HStack{

                        Button{

                            addsurveryfriends.addsurveyfirends.append(user)

                        } label: {

                            Text(user)

                        }

                        

                        Spacer()

                    }

                }

                

            }

            .searchable(text: $searchText)

            .navigationTitle("Add friends")



    }

        

    }

    var r: [String] {

        //let n = myfriends.myFriends.map{ $0}

        let n = userInfo.friends.map{ $0}





        return searchText == "" ? n : n.filter{

            $0.contains(searchText)

        }

    }

}



struct addFriendsSurvey_Previews: PreviewProvider {

    static var previews: some View {

        addFriendsSurvey()

            .environmentObject(DataManager())

            .environmentObject(myFriends())

            .environmentObject(addSurveyFriends())

            .environmentObject(UserInfo())

    }

}





