
import Foundation

let planFilePath = documentsPath + "/myPlan5.plist"
let majorPlanFilePath = documentsPath + "/myMajorPlan5.plist"
let generalPlanFilePath = documentsPath + "/myGeneralPlan5.plist"

var planList:[String] = [ ]

var selectedPlan: String = "ALL"

var majorList:[PlanLecture] = []
var generalList:[PlanLecture] = []

func loadPlanData() -> Bool{
    
//    if FileManager.default.fileExists(atPath: planFilePath), FileManager.default.fileExists(atPath: majorPlanFilePath), FileManager.default.fileExists(atPath: generalPlanFilePath) {
//        //도큐먼트의 myPlan.plist에서 데이터를 읽는다
//        if let plans = NSArray(contentsOfFile: planFilePath), let majorLectures = NSArray(contentsOfFile: majorPlanFilePath), let generalLectures = NSArray(contentsOfFile: generalPlanFilePath){
//
//            for p in plans {
//                if let planDict = p as? [String: Any] {
//                    planList.append(planDict["semester"] as! String)
//                }
//            }
//
//            for m in majorLectures {
//                if let majorDict = m as? [String: Any] {
//                    if let major = PlanLecture(dict: majorDict, category: "전공") {
//                        majorList.append(major)
//                    }
//                }
//            }
//
//            for g in generalLectures {
//                if let generalDict = g as? [String: Any] {
//                    if let general = PlanLecture(dict: generalDict, category: "교양") {
//                        generalList.append(general)
//                    }
//                }
//            }
//
//        }
//    }
//    else {
//        // 번들에서 데이터를 읽는다
//        if let myPlanPath = Bundle.main.path(forResource: "MyPlan", ofType:"plist"), let myPlanMajorPath = Bundle.main.path(forResource: "MyPlanMajor", ofType:"plist"), let myPlanGeneralPath = Bundle.main.path(forResource: "MyPlanGeneral", ofType:"plist"){
//            if let plans = NSArray(contentsOfFile: myPlanPath), let majorLectures = NSArray(contentsOfFile: myPlanMajorPath), let generalLectures = NSArray(contentsOfFile: myPlanGeneralPath){
//
//                for p in plans {
//                    if let planDict = p as? [String: Any] {
//                        planList.append(planDict["semester"] as! String)
//                    }
//                }
//
//                for m in majorLectures {
//                    if let majorDict = m as? [String: Any] {
//                        if let major = PlanLecture(dict: majorDict, category: "전공") {
//                            majorList.append(major)
//                        }
//                    }
//                }
//
//                for g in generalLectures {
//                    if let generalDict = g as? [String: Any] {
//                        if let general = PlanLecture(dict: generalDict, category: "교양") {
//                            generalList.append(general)
//                        }
//                    }
//                }
//
//            }
//        }
//
//    }
    
    if let myPlanPath = Bundle.main.path(forResource: "MyPlan", ofType:"plist"), let myPlanMajorPath = Bundle.main.path(forResource: "MyPlanMajor", ofType:"plist"), let myPlanGeneralPath = Bundle.main.path(forResource: "MyPlanGeneral", ofType:"plist"){
        if let plans = NSArray(contentsOfFile: myPlanPath), let majorLectures = NSArray(contentsOfFile: myPlanMajorPath), let generalLectures = NSArray(contentsOfFile: myPlanGeneralPath){
            
            for p in plans {
                if let planDict = p as? [String: Any] {
                    planList.append(planDict["semester"] as! String)
                }
            }
            
            for m in majorLectures {
                if let majorDict = m as? [String: Any] {
                    if let major = PlanLecture(dict: majorDict) {
                        majorList.append(major)
                    }
                }
            }
            
            for g in generalLectures {
                if let generalDict = g as? [String: Any] {
                    if let general = PlanLecture(dict: generalDict) {
                        generalList.append(general)
                    }
                }
            }
            
        }
    }

    
    let planDicts:[[String:Any]] = planList.map{ ["semester" : $0] }
    let majorPlanDicts:[[String:Any]] = majorList.map{$0.toDict()}
    let generalPlanDicts:[[String:Any]] = generalList.map{$0.toDict()}
    
    if NSArray(array: planDicts).write(toFile: planFilePath, atomically: true), NSArray(array: majorPlanDicts).write(toFile: majorPlanFilePath, atomically: true), NSArray(array: generalPlanDicts).write(toFile: generalPlanFilePath, atomically: true){
        print("성공")
        print(planList)
        return true
    }
    else {
        print("실패")
        return false
    }
}

func addSemester() -> Bool{
    let planDicts:[[String:Any]] = planList.map{ ["semester" : $0] }
    
    if NSArray(array: planDicts).write(toFile: planFilePath, atomically: true){
        print("성공")
        print(planList)
        return true
    }
    else {
        print("실패")
        return false
    }
}
