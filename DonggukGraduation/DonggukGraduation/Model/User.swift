
import Foundation

class User {
    var name: String
    var college: String
    var department: String
    var admissionYear: Int
    
    init?(dict: [String:Any]) {
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let collegeValue = dict["college"] as? String else { return nil }
        guard let departmentValue = dict["department"] as? String else { return nil }
        guard let admissionYearValue = dict["admissionYear"] as? Int else { return nil }
        
        name = nameValue
        college = collegeValue
        department = departmentValue
        admissionYear = admissionYearValue
    }
    
    func toDict() -> [String: Any]{
        return [ "name": name, "college": college, "department": department, "admissionYear": admissionYear ]
    }
}

extension User: CustomStringConvertible {
    var description: String {
        return "<User: \(name), \(college), \(department), \(admissionYear)>"
    }
}
