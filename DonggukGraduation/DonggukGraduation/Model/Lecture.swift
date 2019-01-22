
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
    
//    init?(dict: [String: Any]){
//        guard let nameValue = dict["name"] as? String else { return nil }
//        guard let categoryValue = dict["name"] as? String else { return nil }
//        guard let nameValue = dict["name"] as? String else { return nil }
//    }
//
//    func toDict() -> [String: Any] {
//        return ["name": name, "capacity": capacity]
//    }
}

extension Lecture: CustomStringConvertible {
    var description: String {
        return "<Lecture: \(name), \(category), \(credit)>"
    }
}
