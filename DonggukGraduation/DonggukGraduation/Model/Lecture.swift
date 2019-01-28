
import Foundation

class Lecture {
    var name: String
    var category: String
    var categorySmall: String
    var credit: Int
    
    init(name: String, category: String, categorySmall: String, credit: Int){
        self.name = name
        self.category = category
        self.categorySmall = categorySmall
        self.credit = credit
    }
    
    init?(dict: [String: Any]){
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let creditValue = dict["credit"] as? Int else { return nil }
        guard let cValue = dict["category"] as? String else { return nil }
        guard let csValue = dict["categorySmall"] as? String else { return nil }
        
        name = nameValue
        category = cValue
        categorySmall = csValue
        credit = creditValue
    }
    
    func toDict() -> [String: Any] {
        return ["name": name, "credit": credit, "category": category, "categorySmall":categorySmall]
    }
}

extension Lecture: CustomStringConvertible {
    var description: String {
        return "<Lecture: \(name), \(category), \(categorySmall), \(credit)>"
    }
}
