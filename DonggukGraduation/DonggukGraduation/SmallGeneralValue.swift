import Foundation

class SmallGeneral {
    var category:String
    var name:String
    var englishName:String
    
    init?(dict:[String: Any]){
        guard let categoryValue = dict["category"] as? String else { return nil }
        guard let nameValue = dict["name"] as? String else { return nil }
        guard let englishNameValue = dict["englishName"] as? String else { return nil }
        
        category = categoryValue
        name = nameValue
        englishName = englishNameValue
    }
    func toDict() -> [String:Any]{
        return ["category":category, "name": name, "englishName": englishName]
    }
}

extension SmallGeneral: CustomStringConvertible {
    var description: String {
        return "<SmallGeneral: \(category), \(name), \(englishName)>"
    }
}

var smallGeneralFilePath = documentsPath + "/smallGeneral.plist"

var smallGeneralList:[SmallGeneral] = []

func loadSmallGeneralData() -> Bool {
    if let smallGeneralPath = Bundle.main.path(forResource: "GeneralSmallCategory", ofType:"plist") {
        if let smallGenerals = NSArray(contentsOfFile: smallGeneralPath){
            
            for s in smallGenerals {
                if let smallGeneralDict = s as? [String: Any] {
                    if let smallGeneral = SmallGeneral(dict:smallGeneralDict) {
                        smallGeneralList.append(smallGeneral)
                    }
                }
            }
            
        }
    }
    
    let smallGeneralDicts = smallGeneralList.map{ $0.toDict() }
    
    if NSArray(array: smallGeneralDicts).write(toFile: smallGeneralFilePath, atomically: true){
        print(smallGeneralList)
        return true
    }
    else {
        return false
    }
    
}
