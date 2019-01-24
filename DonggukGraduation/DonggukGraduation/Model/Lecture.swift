
import Foundation

class Lecture {
    var name: String
    var category: String
    var credit: Int

    init(name: String, category: String, credit: Int){
        self.name = name
        self.category = category
        self.credit = credit
    }
    
    init?(dict: [String: Any], category: String){
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let creditValue = dict["credit"] as? Int else { return nil }
        
        name = nameValue
        self.category = category
        credit = creditValue
    }

    func toDict() -> [String: Any] {
        return ["name": name, "capacity": capacity]
    }
}

extension Lecture: CustomStringConvertible {
    var description: String {
        return "<Lecture: \(name), \(category), \(credit)>"
    }
}
