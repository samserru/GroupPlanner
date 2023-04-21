import Foundation



import SwiftUI
struct CreateSurveyView: View {
    
    
    
    @EnvironmentObject var surveyList: SurveyList
    @State var survey: Survey = Survey()
    @EnvironmentObject var addsurveryfriends: addSurveyFriends
    @State var date = Date()
    @State private var showDatePicker = false
    @State private var timeIntrerval = 10000
    @State var activities: [Activities] = [Activities()]
    @State var surveyName = ""
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var datamanager: DataManager
    

    @State private var searchText = ""
    
 
    @State var addFriends: [String] = []
    
    // @Binding var myFriends: [String]
    
    
    
    
    
    
    
    var body: some View {
        
        
  
        NavigationView{
            
            
            
            VStack {
                
                
                
                TextField("Survey name", text: $surveyName)
                
                    .padding()
                
                
                Button(action: {
                                                     self.showDatePicker.toggle()
                                                 }) {
                                                     HStack {
                                                         Text("Experation Date")
                                                             .font(.footnote)
                                                             
                                                          
                                                        
                                                     }
                                                 }
                                                 .sheet(isPresented: $showDatePicker) {
                                                     DatePicker("Expiration Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                                                 
                                                     

                                                 }
                
                List {
                    
                    
                    
                    ForEach($activities) { $activity in
                        
                        
                        
                        Section(header: Text("Activity")) {
                            
                            
                            
                            TextField("Activity Name", text: $activity.name)
                            
                            
                            
                            TextField("Description", text: $activity.description)
                            
                            
                            
                            
                            
                            DatePicker(
                                
                                
                                
                                "Date",
                                
                                
                                
                                selection: $activity.date,
                                
                                
                                
                                displayedComponents: [.date]
                                
                                
                                
                            )
                            
                            
                            
                            DatePicker(
                                
                                
                                
                                "Time",
                                
                                
                                
                                selection: $activity.date,
                                
                                
                                
                                displayedComponents: [.hourAndMinute]
                                
                                
                                
                            )
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
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
                        
                        
                        
                        
                        
                        survey = Survey(name: surveyName, activities: activities, date: date)
                                              let now = Date()
                                              let diffComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: now, to: date)
                                              let days = Double(diffComponents.day!)*86400.0
                                              let hours = Double(diffComponents.hour!)*3600.0
                                              let minutes = Double(diffComponents.minute!)*60.0
                                              let seconds = Double(diffComponents.second!)
                                              let timeInterval = days+hours+minutes+seconds
                                              print("\(timeInterval)")
                                              survey.scheduleExpirationNotification(timeIntervals: timeInterval)
                      //                        datamanager.surveys.append(survey)
                        
                
                        
            
                        
                        
                        
                        
                        
                        
                        
                        for x in r{
                            
                            
                            
                            datamanager.addUserSurvey(real: x, s: survey.name, surv: survey)
                            
                            
                            
                            for a in survey.activities {
                                
                                
                                
                                datamanager.addActivity(s: survey.name, real: x, act: a)
                                
                                
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
             
                        
                        
                        
                    } label: {
                        
                        
                        
                        
                        
                        
                        
                        
                        //  NavigationLink(destination: BaseView(viewState: Binding.constant(viewState))){
                        
                        
                        
                        Text("Send Survey")
                        
                        
                        
                            .padding()
                        
                        
                        
                            .foregroundColor(Color.white)
                        
                        
                        
                            .background(Color.highlight)
                        
                        
                        
                            .cornerRadius(30)
                        
                        //  }
                        
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    
                }
                
                
                
            }
            
            
            
        }
        
        
        
    }
    
    
    
    var r: [String]{
        
        
        
        addsurveryfriends.addsurveyfirends.append(userInfo.realName)
        
        
        
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
        
        
        
            .environmentObject(UserInfo())
        
        
        
        
        
    }
    
    
    
}



