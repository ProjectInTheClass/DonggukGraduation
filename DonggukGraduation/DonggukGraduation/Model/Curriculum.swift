import Foundation

class Curriculum {

    var englishScore: Int // 영어성적
    var englishScoreDetail: String // 영어성적detail
    
    var englishLecture: Int // 영어강의
    var englishLectureDetail: String // 영어강의detail
    
    var serviceTime: Int // 봉사시간
    
    var allCredit: Int // 총학점
    var majorCredit: Int // 전공학점
    var majorCreditDetail: String // 전공학점detail
    var majorSpecialty: Int // 전공전문
    
    var generalCommon: Int // 공통교양
    var generalCommonDetail: String // 공통교양detail
    var generalLiteracy: Int // 기본소양
    var generalLiteracyDetail: String // 기본소양detail
    var generalBasic: Int // 학문기초
    var generalBasicDetail: String // 학문기초detail
    
    var graduationPaper: String // 졸업논문
    
    init?(dict: [String: Any]){
        guard let esValue = dict["englishScore"] as? Int else { return nil }
        guard let esdValue = dict["englishScoreDetail"] as? String else { return nil }
        guard let elValue = dict["englishLecture"] as? Int else { return nil }
        guard let eldValue = dict["englishLectureDetail"] as? String else { return nil }
        guard let stValue = dict["serviceTime"] as? Int else { return nil }
        guard let acValue = dict["allCredit"] as? Int else { return nil }
        guard let mcValue = dict["majorCredit"] as? Int else { return nil }
        guard let mcdValue = dict["majorCreditDetail"] as? String else { return nil }
        guard let msValue = dict["majorSpecialty"] as? Int else { return nil }
        guard let gcValue = dict["generalCommon"] as? Int else { return nil }
        guard let gcdValue = dict["generalCommonDetail"] as? String else { return nil }
        guard let glValue = dict["generalLiteracy"] as? Int else { return nil }
        guard let gldValue = dict["generalLiteracyDetail"] as? String else { return nil }
        guard let gbValue = dict["generalBasic"] as? Int else { return nil }
        guard let gbdValue = dict["generalBasicDetail"] as? String else { return nil }
        guard let gpValue = dict["graduationPaper"] as? String else { return nil }
        
        englishScore = esValue
        englishScoreDetail = esdValue
        englishLecture = elValue
        englishLectureDetail = eldValue
        serviceTime = stValue
        allCredit = acValue
        majorCredit = mcValue
        majorCreditDetail = mcdValue
        majorSpecialty = msValue
        generalCommon = gcValue
        generalCommonDetail = gcdValue
        generalLiteracy = glValue
        generalLiteracyDetail = gldValue
        generalBasic = gbValue
        generalBasicDetail = gbdValue
        graduationPaper = gpValue
    }
    
    func toDict() -> [String: Any] {
        return ["englishScore": englishScore,
        "englishScoreDetail": englishScoreDetail,
        "englishLecture": englishLecture,
        "englishLectureDetail": englishLectureDetail,
        "serviceTime": serviceTime,
        "allCredit": allCredit,
        "majorCredit": majorCredit,
        "majorCreditDetail": majorCreditDetail,
        "majorSpecialty": majorSpecialty,
        "generalCommon": generalCommon,
        "generalCommonDetail": generalCommonDetail,
        "generalLiteracy": generalLiteracy,
        "generalLiteracyDetail": generalLiteracyDetail,
        "generalBasic": generalBasic,
        "generalBasicDetail": generalBasicDetail,
        "graduationPaper": graduationPaper]
    }
}

extension Curriculum: CustomStringConvertible {
    var description: String {
        return "<Department: \(englishScore), \(englishScoreDetail), \(englishLecture), \(englishLectureDetail), \(serviceTime), \(allCredit), \(majorCredit), \(majorCreditDetail), \(majorSpecialty), \(generalCommon), \(generalCommonDetail), \(generalLiteracy), \(generalLiteracyDetail), \(generalBasic), \(generalBasicDetail), \(graduationPaper)>"
    }
}

//
//class Curriculum {
//
//    var englishScore: Int // 영어성적
//    var englishScoreDetail: String // 영어성적detail
//
//    var englishLecture: Bool // 영어강의
//    var englishLectureDetail: Bool // 영어강의detail
//
//    var serviceTime: Int // 봉사시간
//
//    var allCredit: Int // 총학점
//    var majorCredit: Int // 전공학점
//    var majorCreditDetail: Int // 전공학점detail
//    var majorSpecialty: Int // 전공전문
//
//    var generalNormal: Int // 일반교양
//    var generalCommon: Int // 공통교양
//    var generalMain: Int // 핵심교양
//    var generalBasic: Int // 학문기초
//
//    var graduationPaper: String // 졸업논문
//
//    init?(){
//
//    }
//}
//
