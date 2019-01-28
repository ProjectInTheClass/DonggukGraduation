
import Foundation

var myCurriFilePath = documentsPath + "/myCurri.plist"

var myCurri:Curriculum?

func loadMyCurriData() -> Bool {
    if let curriPath = Bundle.main.path(forResource: "MyCurriculum", ofType:"plist") {
        if let curri = NSDictionary(contentsOfFile: curriPath){
            if let curriDict = curri as? [String: Any] {
                myCurri = Curriculum(dict:curriDict)
            }
        }
    }
    
    let curriDict:[String:Any] = (myCurri?.toDict())!
    
    if NSDictionary(dictionary: curriDict).write(toFile: myCurriFilePath, atomically: true){
        print(myCurri)
        return true
    }
    else {
        print("실패")
        return false
    }
}
