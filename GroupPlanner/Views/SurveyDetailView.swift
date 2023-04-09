import SwiftUI

struct SurveyDetailView: View {
    @Binding var survey: Survey
    
    var body: some View {
        List {
            ForEach(survey.activities) { activity in
                Section(header: Text(activity.name)) {
                    ForEach(activity.datesList) { dates in
                        ForEach(dates.timesList) { times in
                            HStack {
                                Text(dates.date, style: .date)
                                Spacer()
                                Text(times.date, style: .time)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(survey.name)
    }
}



struct SurveyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyDetailView(survey: Binding.constant(Survey(name:"Test", activities: [Activities()])))
    }
}
