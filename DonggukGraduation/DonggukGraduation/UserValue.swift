//
//import Foundation
//
//class User {
//    var name: String
//    var college: String
//    var department: String
//    var admissionYear: Int
//    
//    init(name: String, college: String, department: String, admissionYear: Int) {
//        self.name = name
//        self.college = college
//        self.department = department
//        self.admissionYear = admissionYear
//    }
//    
////    init(dict: [String:Any]) {
////
////    }
//}
//
//var myInfo: User = User(name: "육지수", college: "공과대학", department: "컴퓨터공학과", admissionYear: 13)
//
//func loadUserData() -> Bool{
//    
//    if let userPath = Bundle.main.path(forResource: "User", ofType:"plist") {
//        if let user = NSDictionary(contentsOfFile: userPath) {
//            if let userDict = user as? [String: Any] {
//                myInfo = User(dict:userDict)
//            }
//        }
//    }
//    
//    return true
//}
