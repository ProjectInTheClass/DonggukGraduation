
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
    
    let userDicts:[String:Any] = (myInfo?.toDict())!
    
    if NSDictionary(dictionary: userDicts).write(toFile: userFilePath, atomically: true){
        print(myInfo)
        return true
    }
    else {
        print("실패")
        return false
    }
}
