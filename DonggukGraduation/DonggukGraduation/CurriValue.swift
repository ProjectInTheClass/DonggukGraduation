
import Foundation

var departmentCurriFilePath = documentsPath + "/departmentCurri.plist"

var departmentCurri:Curriculum?

func loadDepartmentCurriData(department:String) -> Bool {
    if let curriPath = Bundle.main.path(forResource: "Curriculum", ofType:"plist") {
        if let curris = NSArray(contentsOfFile: curriPath){
            
            for c in curris {
                if let curriDict = c as? [String: Any] {
                    guard let year = curriDict["admissionYear"] as? Int else { return false }
                    
                    print(myInfo?.admissionYear)
                    if year == myInfo?.admissionYear {
                        print("ok")
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
