import Foundation

class BigGeneral {
    var name:String
    
    init?(dict:[String: Any]){
        guard let nameValue = dict["name"] as? String else { return nil }
        
        name = nameValue
    }
    func toDict() -> [String:Any]{
        return ["name": name]
    }
}

extension BigGeneral: CustomStringConvertible {
    var description: String {
        return "<BigGeneral: \(name)>"
    }
}

var bigGeneralFilePath = documentsPath + "/bigGeneral.plist"

var bigGeneralList:[BigGeneral] = []

func loadBigGeneralData() -> Bool {
    if let generalPath = Bundle.main.path(forResource: "GeneralBigCategory", ofType:"plist") {
        if let generals = NSArray(contentsOfFile: generalPath){
            
            for g in generals {
                if let generalDict = g as? [String: Any] {
                    if let general = BigGeneral(dict:generalDict) {
                        bigGeneralList.append(general)
                    }
                }
            }
            
        }
    }
    
    let generalDicts = bigGeneralList.map{ $0.toDict() }
    
    if NSArray(array: generalDicts).write(toFile: bigGeneralFilePath, atomically: true){
        print(bigGeneralList)
        return true
    }
    else {
        return false
    }
    
}
