
import Foundation

var departmentCurriFilePath = documentsPath + "/departmentCurri.plist"

var departmentCurri:Curriculum?

func loadDepartmentCurriData() -> Bool {
    if let curriPath = Bundle.main.path(forResource: "CSECurriculum", ofType:"plist") {
        if let curris = NSArray(contentsOfFile: curriPath){
            
            for c in curris {
                if let curriDict = c as? [String: Any] {
                    guard let year = curriDict["admissionYear"] as? Int else { return false }

                    if year == myInfo?.admissionYear {
                        departmentCurri = Curriculum(dict:curriDict)
                    }
                    
                }
            }
            
        }
    }
    
    let curriDicts:[String:Any] = (departmentCurri?.toDict())!
    
    if NSDictionary(dictionary: curriDicts).write(toFile: departmentCurriFilePath, atomically: true){
        print(departmentCurri)
        return true
    }
    else {
        print("실패")
        return false
    }
    
}
