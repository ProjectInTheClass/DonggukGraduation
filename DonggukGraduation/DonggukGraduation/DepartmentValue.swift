import Foundation

class Department {
    var college:String
    var name:String
    var englishName:String
    
    init?(dict:[String: Any]){
        guard let collegeValue = dict["college"] as? String else { return nil }
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let englishNameValue = dict["englishName"] as? String else { return nil }
        
        college = collegeValue
        name = nameValue
        englishName = englishNameValue
    }
    func toDict() -> [String:Any]{
        return ["college":college, "name": name, "englishName": englishName]
    }
}

extension Department: CustomStringConvertible {
    var description: String {
        return "<Department: \(college), \(name), \(englishName)>"
    }
}

var departmentFilePath = documentsPath + "/department.plist"

var departmentList:[Department] = []

func loadDepartmentData() -> Bool {
    if let departmentPath = Bundle.main.path(forResource: "Department", ofType:"plist") {
        if let departments = NSArray(contentsOfFile: departmentPath){
            
            for d in departments {
                if let departmentDict = d as? [String: Any] {
                    if let department = Department(dict:departmentDict) {
                        departmentList.append(department)
                    }
                }
            }
            
        }
    }
    
    let departmentDicts = departmentList.map{ $0.toDict() }
    
    if NSArray(array: departmentDicts).write(toFile: departmentFilePath, atomically: true){
        print(departmentList)
        return true
    }
    else {
        return false
    }
    
}
