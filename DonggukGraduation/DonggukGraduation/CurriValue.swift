
import Foundation

var departmentCurriFilePath = documentsPath + "/departmentCurri.plist"

var departmentCurri:Curriculum?

func loadDepartmentCurriData() -> Bool {
    if let curriPath = Bundle.main.path(forResource: "Curriculum", ofType:"plist") {
        if let curris = NSArray(contentsOfFile: curriPath){
            
            for c in curris {
                if let curriDict = c as? [String: Any] {
                    guard let year = curriDict["admissionYear"] as? Int else { return false }
                    guard let department = curriDict["department"] as? String else { return false }
                    
                    if year == myInfo?.admissionYear, department == myInfo?.department {
                        departmentCurri = Curriculum(dict:curriDict)
                    }
                    
                }
            }
            
        }
    }
    print("ok1")
    let curriDicts:[String:Any] = (departmentCurri?.toDict())!
    print("ok2")
    if NSDictionary(dictionary: curriDicts).write(toFile: departmentCurriFilePath, atomically: true){
        print(departmentCurri)
        return true
    }
    else {
        print("실패")
        return false
    }
    
}
