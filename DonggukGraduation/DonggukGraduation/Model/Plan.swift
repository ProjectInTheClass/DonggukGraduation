
import Foundation

class Plan {
    var semester: String
    var majorList: [Lecture]
    var generList: [Lecture]
    
    init(semester: String, majorList: [Lecture], generList: [Lecture]) {
        self.semester = semester
        self.majorList = majorList
        self.generList = generList
    }
    
}
