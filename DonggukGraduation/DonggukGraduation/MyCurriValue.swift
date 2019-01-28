
import Foundation

var testV = true

var myCurriFilePath = documentsPath + "/myCurri.plist"

var myCurri:MyCurriculum?

func loadMyCurriData() -> Bool {
    if let curriPath = Bundle.main.path(forResource: "MyCurriculum", ofType:"plist") {
        if let curri = NSDictionary(contentsOfFile: curriPath){
            if let curriDict = curri as? [String: Any] {
                myCurri = MyCurriculum(dict:curriDict)
                print(myCurri)
            }
        }
    }
    
    
    if saveMyCurriData() {
        print("my curri data 불러오기 성공")
        return true
    }
    else {
        print("my curri data 불러오기 성공")
        return false
    }
}

func saveMyCurriData() -> Bool {
    let curriDict:[String:Any] = (myCurri?.toDict())!
    
    if NSDictionary(dictionary: curriDict).write(toFile: myCurriFilePath, atomically: true){
        print(myCurri)
        print("my curri data 저장 성공")
        return true
    }
    else {
        print("my curri data 저장 실패")
        return false
    }
}
