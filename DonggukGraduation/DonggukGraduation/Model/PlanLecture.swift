
import Foundation

class PlanLecture {
    var name: String
    var category: String
    var credit: Int
    var semester: String
    
    init(name: String, category: String, credit: Int, semester: String){
        self.name = name
        self.category = category
        self.credit = credit
        self.semester = semester
    }
    
    init?(dict: [String: Any], category: String){
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let creditValue = dict["credit"] as? Int else { return nil }
        guard let semesterValue = dict["semester"] as? String else { return nil }
        
        name = nameValue
        self.category = category
        credit = creditValue
        semester = semesterValue
    }
    
    func toDict() -> [String: Any] {
        return ["name": name, "credit": credit, "semester": semester]
    }
}

extension PlanLecture: CustomStringConvertible {
    var description: String {
        return "<PlanLecture: \(name), \(category), \(credit), \(semester)>"
    }
}
