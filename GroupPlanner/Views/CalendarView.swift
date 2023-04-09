import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var surveyList: SurveyList
    
    var body: some View {
        NavigationView {
            List(surveyList.surveyList) { s in
                NavigationLink(destination: SurveyDetailView(survey: Binding.constant(s))) {
                    Text(s.name)
                }
            }
            .navigationTitle("Surveys")
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(SurveyList())
    }
}
