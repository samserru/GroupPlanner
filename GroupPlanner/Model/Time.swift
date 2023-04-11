import Foundation



class timesList: ObservableObject, Identifiable{

    @Published var date: Date = Date()

    @Published var timeLikes: Int = 0

    @Published var timeLike: Bool = false

    @Published var rand: Int = Int.random(in: 1..<10000)

    

    init(date: Date = Date(), timesLikes: Int = 0, timeLike: Bool = false){

        self.date = date

        self.timeLikes = timeLikes

        self.timeLike = timeLike

    }

}



class dates: ObservableObject, Identifiable{

    @Published var date: Date = Date()

    @Published var dateLikes: Int = 0

    @Published var dateLike: Bool = false

    @Published var rand: Int = Int.random(in: 1..<10000)

    @Published var timesList: [timesList] = []



    

    init(date: Date = Date(), dateLikes: Int = 0, dateLike: Bool = false, timesList: [timesList] = []){

        self.date = date

        self.dateLikes = dateLikes

        self.dateLike = dateLike

        self.timesList=timesList

    }

}







