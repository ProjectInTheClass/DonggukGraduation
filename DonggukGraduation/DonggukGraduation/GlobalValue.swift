
import Foundation

let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

var planList:[Plan] = []
var selectedPlan: Plan?
var majorList:[Lecture] = []
var generalList:[Lecture] = []

func loadPlanDate() -> Bool{
    let filePath = documentsPath + "/myPlan.plist"
    
    if FileManager.default.fileExists(atPath: filePath) {
        //도큐먼트의 myPlan.plist에서 데이터를 읽는다
        
    }
    else {
        // 번들에서 데이터를 읽는다
        if let myPlanPath = Bundle.main.path(forResource: "MyPlan", ofType:"plist"), let myPlanMajorPath = Bundle.main.path(forResource: "MyPlanMajor", ofType:"plist"), let myPlanGeneralPath = Bundle.main.path(forResource: "MyPlanGeneral", ofType:"plist"){
            if let plans = NSArray(contentsOfFile: myPlanPath), let majorLectures = NSArray(contentsOfFile: myPlanMajorPath), let generalLectures = NSArray(contentsOfFile: myPlanGeneralPath){
                
                for m in majorLectures {
                    if let majorDict = m as? [String: Any] {
                        if let major = Lecture(dict: majorDict, category: "전공") {
                            majorList.append(major)
                        }
                    }
                }
                
                for g in generalLectures {
                    if let generalDict = g as? [String: Any] {
                        if let general = Lecture(dict: generalDict, category: "교양") {
                            generalList.append(general)
                        }
                    }
                }
                
                for p in plans {
                    if let planDict = p as? [String: Any] {
                        if let plan = Plan(dict: planDict) {
                            planList.append(plan)
                        }
                    }
                }
                
            }
        }
        
    }
//
//    let roomDicts:[[String:Any]] = rooms.map{$0.toDict()}
//    let result = NSArray(array: roomDicts).write(toFile: filePath, atomically: true)
//
//    if result { print("저장성공") }
//    else { print("실패")}
    return true
}
