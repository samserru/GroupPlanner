import SwiftUI



struct FriendView: View {

    

    @EnvironmentObject var datamanager: DataManager

    @EnvironmentObject var userInfo: UserInfo

    @State private var searchText = ""

    @State private var searchText2 = ""

    @EnvironmentObject var myfriends: myFriends

    

    

    var body: some View {

        VStack{

            NavigationView{

                List{

                    ForEach(r, id: \.self) { user in

                        HStack{

                            Button{

                                var check: Bool = true

                                userInfo.friends.forEach{m in

                             //   myfriends.myFriends.forEach { m in

                                    if user == m {

                                       check = false

                                    }

                                }

                                if check{

                                   // myfriends.myFriends.append(user)

                                    userInfo.friends.append(user)

                                    datamanager.addFriends(real: userInfo.realName, n: user)

                                }

                            } label: {

                                Text(user)

                            }

                            

                            Spacer()

                        }

                    }

                    

                }

                .searchable(text: $searchText)

                .navigationTitle("Find Friends")

                

                

            }

            

            

            NavigationView{

                List{

                    ForEach(r2, id: \.self) { user2 in

                        HStack{

                            Text(user2)

                        }

                    }

                }

                .searchable(text: $searchText2)

                .navigationTitle("My Friends")

            }

        }

    }

            var r: [String] {

                let n = datamanager.u.map{ $0}

                

                return searchText == "" ? n : n.filter{

                    $0.contains(searchText)

                }

            }

            var r2: [String] {

               // let n = myfriends.myFriends.map{ $0}

                let n = userInfo.friends.map{ $0}

                

                return searchText2 == "" ? n : n.filter{

                    $0.contains(searchText2)

                }

            }

        }

        

        struct FriendView_Previews: PreviewProvider {

            static var previews: some View {

                FriendView()

                    .environmentObject(DataManager())

                    .environmentObject(myFriends())

                    .environmentObject(UserInfo())

            }

        }







