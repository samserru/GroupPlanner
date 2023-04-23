import SwiftUI



struct CalendarView: View {
    
    
    @EnvironmentObject var datamanager: DataManager
    @EnvironmentObject var userInfo: UserInfo
    
    
    
    //    @State var currentItem: Survey?
    
    
    
    @Binding var x:String
    
    
    
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("Polls")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.highlight)
                NavigationView{
                    
                    List{
                        Section(header: Text("Pending")
                            .font(.headline)
                            .fontWeight(.bold)
                            
                            .foregroundColor(Color.highlight)
                            .padding()) {
                            ForEach(datamanager.surveys){ s in
                                
                                if(s.checkIfExpired()==false){
                                    NavigationLink(destination: SurveyDetailView(survey: Binding.constant(s))) {
                                        
                                        
                                        ZStack{
                                            HStack{
                                                Text("\(s.name)")
                                                    .padding()
                                                Text(s.dateString)
                                                
                                                
                                            }}
                                        
                                        
                                    }
                                }
                            }
                        }
                        
                        
                        Section(header: Text("Expired Polls")
                            .font(.headline)
                            .fontWeight(.bold)
                            
                            .foregroundColor(Color.highlight)
                            .padding()) {
                            ForEach(datamanager.surveys){ s in
                                
                                if(s.checkIfExpired()){
                                    
                                    NavigationLink(destination: SurveyWinnerView(survey: Binding.constant(s))) {
                                        ZStack{
                                            HStack{
                                                Text("\(s.name)")
                                                    .padding()
                                                
                                                
                                            }}
                                    }
                                }
                            }
                        }
                    }
                }
                .onAppear(){
                    self.datamanager.fetchSurvey(real: x)
                }
            }
        }
        .navigationTitle("Surveys")
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(x: Binding.constant(""))
            .environmentObject(SurveyList())
            .environmentObject(DataManager())
            .environmentObject(UserInfo())
    }
}





