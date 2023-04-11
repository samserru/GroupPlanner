import Foundation

import SwiftUI



struct CreateSurveyView: View {

    @EnvironmentObject var surveyList: SurveyList

    @State var survey: Survey = Survey()

    @State var date = Date()

    @State var currentDate = Date()

    @State var image1: String = "minus.square"

    @State var image2: String = "minus.square"

    @State var image3: String = "minus.square"

    

    @State var activities: [Activities] = [Activities()]

    @State var surveyName = ""

    

    

    

    @EnvironmentObject var datamanager: DataManager

    @State private var searchText = ""

    @State var addFriends: [String] = []

    // @Binding var myFriends: [String]

    

    @EnvironmentObject var addsurveryfriends: addSurveyFriends

    

    var body: some View {

        

        NavigationView{

            VStack {

                TextField("Survey name", text: $surveyName)

                    .padding()

                

                List {

                    ForEach($activities) { $activity in

                        Section(header: Text("Activity")) {

                            TextField("Activity Name", text: $activity.name)

                            

                            ForEach($activity.datesList) { $date in

                                DatePicker(

                                    "Date",

                                    selection: $date.date,

                                    displayedComponents: [.date]

                                )

                                DatePicker(

                                    "Time",

                                    selection: $date.date,

                                    displayedComponents: [.hourAndMinute]

                                )

                                

                                ForEach($date.timesList) { $time in

                                    

                                    DatePicker(

                                        "Time",

                                        selection: $time.date,

                                        displayedComponents: .hourAndMinute

                                    )

                                    

                                }

                                

                                Button(action: {

                                    date.timesList.append(timesList())

                                }, label: {

                                    Text("Add another time")

                                })

                                

                            }

                            

                            Button(action: {

                                activity.datesList.append(dates())

                            }, label: {

                                Text("Add another date")

                            })

                        }

                    }

                    .onDelete { indexSet in

                        activities.remove(atOffsets: indexSet)

                    }

                }

                

                HStack {

                    Spacer()

                    Button(action: {

                        activities.append(Activities())

                    }, label: {

                        Image(systemName: "plus")

                    })

                    

                    Spacer()

                    

                    NavigationLink(destination: addFriendsSurvey()) {

                        Text("Add friends")

                            .padding()

                            .foregroundColor(Color.white)

                            .background(Color.highlight)

                            .cornerRadius(30)

                        

                    }

                    Spacer()

                    Button{

                        

                        survey = Survey(name: surveyName, activities: activities)

                        surveyList.surveyList.append(survey)

                        

                        for x in r{

                            datamanager.addUserSurvey(real: x, s: survey.name )

                            for a in survey.activities {

                                datamanager.addActivity(s: survey.name, real: x, act: a)

                                for b in a.datesList{

                                    datamanager.addDate(s: survey.name, real: x, act: a, d: b)

                                    for c in b.timesList{

                                        datamanager.addTime(s: survey.name, real: x, act: a, d: b, t:c)

                                    }

                                }

                            }

                        }

                        

                        

                        

                        

                    } label: {

                        Text("Send Survey")

                            .padding()

                            .foregroundColor(Color.white)

                            .background(Color.highlight)

                            .cornerRadius(30)

                    }

                    Spacer()

                }

            }

        }

    }

    var r: [String]{

        let n = addsurveryfriends.addsurveyfirends.map{$0}

        return n

    }

}





struct CreateSurveyView_Previews: PreviewProvider {

    static var previews: some View {

        CreateSurveyView()

            .environmentObject(DataManager())

            .environmentObject(addSurveyFriends())

            .environmentObject(SurveyList())

    }

}





