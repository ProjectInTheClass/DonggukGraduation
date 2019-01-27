
import Foundation

class PlanLecture {
    var name: String
    var category: String
    var credit: Int
    var semester: String
    
    init(name: String, category: String, credit: Int){
        self.name = name
        self.category = category
        self.credit = credit
        semester = ""
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

extension Lecture: CustomStringConvertible {
    var description: String {
        return "<Lecture: \(name), \(category), \(credit), \(semester)>"
    }
}
