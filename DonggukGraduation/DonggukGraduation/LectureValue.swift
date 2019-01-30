
import Foundation

var majorLectureFilePath = documentsPath + "/majorLecture.plist"
var generalLectureFilePath = documentsPath + "/generalLecture.plist"

var majorLectureList:[Lecture] = []
var generalLectureList:[Lecture] = []

func loadlectureData() -> Bool {
    if let majorPath = Bundle.main.path(forResource: "MajorLecture", ofType:"plist"), let generalPath = Bundle.main.path(forResource: "GeneralLecture", ofType:"plist") {
        if let majors = NSArray(contentsOfFile: majorPath), let generals = NSArray(contentsOfFile: generalPath){
            
            for m in majors {
                if let majorDict = m as? [String: Any] {
                    if let major = Lecture(dict:majorDict) {
                        majorLectureList.append(major)
                    }
                }
            }
            
            for g in generals {
                if let generalDict = g as? [String: Any] {
                    if let general = Lecture(dict:generalDict) {
                        generalLectureList.append(general)
                    }
                }
            }
            
        }
    }
    
    let majorDicts = majorLectureList.map{ $0.toDict() }
    let generalDicts = generalLectureList.map{ $0.toDict() }
    
    if NSArray(array: majorDicts).write(toFile: majorLectureFilePath, atomically: true), NSArray(array: generalDicts).write(toFile: generalLectureFilePath, atomically: true){
        return true
    }
    else {
        return false
    }
    
}
