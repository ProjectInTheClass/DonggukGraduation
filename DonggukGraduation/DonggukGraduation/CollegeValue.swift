import Foundation

class College {
    var name:String
    
    init?(dict:[String: Any]){
        guard let nameValue = dict["name"] as? String else { return nil }
        
        name = nameValue
    }
    func toDict() -> [String:Any]{
        return ["name": name]
    }
}

extension College: CustomStringConvertible {
    var description: String {
        return "<College: \(name)>"
    }
}

var collegeFilePath = documentsPath + "/college.plist"

var collegeList:[College] = []

func loadCollegeData() -> Bool {
    if let collegePath = Bundle.main.path(forResource: "College", ofType:"plist") {
        if let colleges = NSArray(contentsOfFile: collegePath){
            
            for c in colleges {
                if let collegeDict = c as? [String: Any] {
                    if let college = College(dict:collegeDict) {
                        collegeList.append(college)
                    }
                }
            }

        }
    }
    
    let collegeDicts = collegeList.map{ $0.toDict() }
    
    if NSArray(array: collegeDicts).write(toFile: collegeFilePath, atomically: true){
        print(collegeList)
        return true
    }
    else {
        return false
    }
    
}
