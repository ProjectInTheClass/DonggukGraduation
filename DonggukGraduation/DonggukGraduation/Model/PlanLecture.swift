
import Foundation

class PlanLecture {
    var name: String
    var category: String
    var categorySmall: String
    var credit: Int
    var semester: String
    
    init(name: String, category: String, categorySmall: String, credit: Int, semester: String){
        self.name = name
        self.category = category
        self.categorySmall = categorySmall
        self.credit = credit
        self.semester = semester
    }
    
    init?(dict: [String: Any]){
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let creditValue = dict["credit"] as? Int else { return nil }
        guard let semesterValue = dict["semester"] as? String else { return nil }
        guard let cValue = dict["category"] as? String else { return nil }
        guard let csValue = dict["categorySmall"] as? String else { return nil }
        
        name = nameValue
        category = cValue
        categorySmall = csValue
        credit = creditValue
        semester = semesterValue
    }
    
    func toDict() -> [String: Any] {
        return ["name": name, "credit": credit, "semester": semester, "category": category, "categorySmall":categorySmall]
    }
}

extension PlanLecture: CustomStringConvertible {
    var description: String {
        return "<PlanLecture: \(name), \(category), \(categorySmall), \(credit), \(semester)>"
    }
}
