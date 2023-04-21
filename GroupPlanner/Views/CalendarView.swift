import SwiftUI



struct CalendarView: View {
    
   
    @EnvironmentObject var datamanager: DataManager
    @EnvironmentObject var userInfo: UserInfo
    
    
    
    //    @State var currentItem: Survey?
    
    
    
    @Binding var x:String
    
    
    
    
    
    var body: some View {
        
        //        NavigationView {
        
        //            List(surveyList.surveyList) { s in
        
        //                NavigationLink(destination: SurveyDetailView(survey: Binding.constant(s))) {
        
        //                    Text(s.name)
        
        //                }
        
        //            }
        
        //        }
        
        //            .navigationTitle("Surveys")
        
        //        }
        
        ZStack{
            
            NavigationView{
                
                List{
                    
                    ForEach(datamanager.surveys){ s in
                        
                        if(s.checkIfExpired()){
                     
                        NavigationLink(destination: SurveyWinnerView(survey: Binding.constant(s))) {
                           
                                ZStack{
                                HStack{
                                Text("EXPIRED: \(s.name)")
                                Text(s.dateString)
                                Text(s.mostLikedActivity().name)
                               
                                }}
                           
                            
                            
                        }
                        }
                            else{
                                
                                NavigationLink(destination: SurveyDetailView(survey: Binding.constant(s))) {
                                   
                                        ZStack{
                                        HStack{
                                        Text("\(s.name)")
                                        Text(s.dateString)
                            
                                       
                                        }}
                                   
                                    
                                    
                                }
                            }
                        }
                        
                        
                        
                        //                        .onAppear(){
                        
                        //                            self.datamanager.fetchSurvey(real: s.name)
                        
                        //  }
                        
                        
                        
                        
                        
                        //                .onAppear(){
                        
                        //                    datamanager.surveys.forEach { datamanager.fetchSurvey(real: $0.name) }
                        
                        //             //   }
                        
                        ////
                        
                        ////            }
                        
                    }
                    
                    
                    
                    
                    
                }
                
                .onAppear(){
                    
                    self.datamanager.fetchSurvey(real: x)
                    
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





