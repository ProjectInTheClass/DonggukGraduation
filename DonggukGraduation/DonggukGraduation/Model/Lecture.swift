
import Foundation

class Lecture {
    var name: String
    var credit: Int
    var bigCategory: String
    var smallCategory: String
//    var etc: String
    
    init(name: String, bigCategory: String, smallCategory: String, credit: Int){
        self.name = name
        self.bigCategory = bigCategory
        self.smallCategory = smallCategory
        self.credit = credit
//        self.etc = etc
    }
    
    init?(dict: [String: Any]){
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let creditValue = dict["credit"] as? Int else { return nil }
        guard let cValue = dict["bigCategory"] as? String else { return nil }
        guard let csValue = dict["smallCategory"] as? String else { return nil }
//        guard let deValue = dict["etc"] as? String else { return nil }
        
        name = nameValue
        bigCategory = cValue
        smallCategory = csValue
        credit = creditValue
//        etc = deValue
    }
    
    func toDict() -> [String: Any] {
        return ["name": name, "credit": credit, "category": bigCategory, "categorySmall":smallCategory]
    }
}

extension Lecture: CustomStringConvertible {
    var description: String {
        return "<Lecture: \(name), \(bigCategory), \(smallCategory), \(credit)>"
    }
}
