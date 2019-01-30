
import Foundation

let userFilePath = documentsPath + "/user.plist"

var myInfo: User?

func loadUserData() -> Bool{
    
    if let userPath = Bundle.main.path(forResource: "User", ofType:"plist") {
        if let user = NSDictionary(contentsOfFile: userPath) {
            if let userDict = user as? [String: Any] {
                myInfo = User(dict:userDict)
            }
        }
    }
    
    if myInfo != nil {
        if saveUserData() {
            print("user data 불러오기 성공")
            return true
        }
        else {
            print("user data 불러오기 실패")
            return false
        }
    }
    else {
        print("user data 불러오기 실패")
        return false
    }
    
}

func saveUserData() -> Bool {
    let userDicts:[String:Any] = (myInfo?.toDict())!
    
    if NSDictionary(dictionary: userDicts).write(toFile: userFilePath, atomically: true){
        print(myInfo)
        print("user data 저장 성공")
        return true
    }
    else {
        print("user data 저장 실패")
        return false
    }
}
