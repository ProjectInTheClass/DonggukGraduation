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
    
    var generalCommon: String // 공통교양
    var generalCommonDetail: String // 공통교양detail
    var generalLiteracy: String // 기본소양
    var generalLiteracyDetail: String // 기본소양detail
    var generalBasic: String // 학문기초
    var generalBasicDetail: String // 학문기초detail
    var generalMajorBasic: String // 전공기초
    var generalMajorBasicDetail: String // 전공기초detail
    var generalMain: String // 핵심교양
    var generalMainDetail: String // 핵심교양detail
    
    var graduationPaper: String // 졸업논문
    
    var etc: String // 기타사항
    var etcDetail: String // 기타사항
    
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
        guard let gcValue = dict["generalCommon"] as? String else { return nil }
        guard let gcdValue = dict["generalCommonDetail"] as? String else { return nil }
        guard let glValue = dict["generalLiteracy"] as? String else { return nil }
        guard let gldValue = dict["generalLiteracyDetail"] as? String else { return nil }
        guard let gbValue = dict["generalBasic"] as? String else { return nil }
        guard let gbdValue = dict["generalBasicDetail"] as? String else { return nil }
        guard let gmbValue = dict["generalMajorBasic"] as? String else { return nil }
        guard let gmbdValue = dict["generalMajorBasicDetail"] as? String else { return nil }
        guard let gmValue = dict["generalMain"] as? String else { return nil }
        guard let gmdValue = dict["generalMainDetail"] as? String else { return nil }
        guard let gpValue = dict["graduationPaper"] as? String else { return nil }
        guard let etcValue = dict["etc"] as? String else { return nil }
        guard let etcdValue = dict["etcDetail"] as? String else { return nil }
        
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
        generalMajorBasic = gmbValue
        generalMajorBasicDetail = gmbdValue
        generalMain = gmValue
        generalMainDetail = gmdValue
        graduationPaper = gpValue
        etc = etcValue
        etcDetail = etcdValue
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
        "generalMajorBasic": generalMajorBasic,
        "generalMajorBasicDetail": generalMajorBasicDetail,
        "generalMain": generalMain,
        "generalMainDetail": generalMainDetail,
        "graduationPaper": graduationPaper,
        "etc": etc,
        "etcDetail": etcDetail]
    }
}

extension Curriculum: CustomStringConvertible {
    var description: String {
        return "<Department: \(englishScore), \(englishScoreDetail), \(englishLecture), \(englishLectureDetail), \(serviceTime), \(allCredit), \(majorCredit), \(majorCreditDetail), \(majorSpecialty), \(generalCommon), \(generalCommonDetail), \(generalLiteracy), \(generalLiteracyDetail), \(generalBasic), \(generalBasicDetail), \(graduationPaper), \(etc), \(etcDetail)>"
    }
}
