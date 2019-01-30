
import Foundation

var lectureFilePath = documentsPath + "/lecture.plist"

var lectureList:[Lecture] = []

func loadlectureData() -> Bool {
    if let lecturePath = Bundle.main.path(forResource: "Lecture", ofType:"plist") {
        if let lectures = NSArray(contentsOfFile: lecturePath){
            
            for l in lectures {
                if let lectureDict = l as? [String: Any] {
                    if let lecture = Lecture(dict:lectureDict) {
                        lectureList.append(lecture)
                    }
                }
            }
            
        }
    }
    
    let lectureDicts = lectureList.map{ $0.toDict() }
    
    if NSArray(array: lectureDicts).write(toFile: lectureFilePath, atomically: true){
        return true
    }
    else {
        return false
    }
    
}
