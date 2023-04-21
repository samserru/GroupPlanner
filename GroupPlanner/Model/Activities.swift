import Foundation





class Activities: ObservableObject, Identifiable{

    @Published var name: String = ""

    @Published var description: String = ""

  //  @Published var datesList: [dates] = []

    @Published var date: Date

     var dateString: String {

        let formatter = DateFormatter()

        formatter.dateFormat = "EEEE, dd 'of' MMMM 'at' HH:mm"

        return formatter.string(from: date)

    }

    @Published var activityLike: Bool = false

    @Published var totalActivityLikes: Int = 0

    @Published var id: UUID = UUID()

    

    init(name: String = "", description: String = "", activityLike: Bool = false, totalActivityLikes: Int = 0, date: Date = Date()){

        self.name = name

       // self.datesList = datesList

        self.date = date

        self.activityLike = activityLike

        self.totalActivityLikes = totalActivityLikes

    }

}







import Foundation
import SwiftUI
