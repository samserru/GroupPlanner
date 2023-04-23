import Foundation





class Activities: ObservableObject, Identifiable{

    @Published var name: String = ""

    @Published var description: String = ""


    @Published var date: Date

     var dateString: String {

        let formatter = DateFormatter()

        formatter.dateFormat =   "EEEE, dd 'of' MMMM 'at' HH:mm"
         //'at' HH:mm"
         
         

        return formatter.string(from: date)

    }

    @Published var activityLike: Bool = false

    @Published var totalActivityLikes: Int = 0

    @Published var id: UUID = UUID()

    

    init(name: String = "", description: String = "", activityLike: Bool = false, totalActivityLikes: Int = 0, date: Date = Date()){

        self.name = name

        self.description = description

        self.date = date

        self.activityLike = activityLike

        self.totalActivityLikes = totalActivityLikes

    }




    func vote() {
        if(self.activityLike == false){
        self.totalActivityLikes+=1
        }
        else{
            self.totalActivityLikes+=1
        }
    }




}










import Foundation
import SwiftUI
