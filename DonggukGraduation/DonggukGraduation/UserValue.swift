
import Foundation

class User {
    var name: String
    var college: String
    var department: String
    var admissionYear: Int
    
    init(name: String, college: String, department: String, admissionYear: Int) {
        self.name = name
        self.college = college
        self.department = department
        self.admissionYear = admissionYear
    }
}

var myInfo: User = User(name: "육지수", college: "공과대학", department: "컴퓨터공학과", admissionYear: 13)
