import Foundation

class MyCurriculum {
    
    var englishScore: Bool // 영어성적
    var englishLecture: Int // 영어강의
    
    var serviceTime: Int // 봉사시간
    
    var allCredit: Int // 총학점
    var majorCredit: Int // 전공학점
    var majorSpecialty: Int // 전공전문
    
    var generalCommon: Int // 공통교양
    var generalCulture: Int // 일반교양
    var generalLiteracy: Int // 기본소양
    var generalBasic: Int // 학문기초
    
    var graduationPaper: Bool // 졸업논문
    
    init?(dict: [String: Any]){
        guard let esValue = dict["englishScore"] as? Bool else { return nil }
        guard let elValue = dict["englishLecture"] as? Int else { return nil }
        guard let stValue = dict["serviceTime"] as? Int else { return nil }
        guard let acValue = dict["allCredit"] as? Int else { return nil }
        guard let mcValue = dict["majorCredit"] as? Int else { return nil }
        guard let msValue = dict["majorSpecialty"] as? Int else { return nil }
        guard let gcValue = dict["generalCommon"] as? Int else { return nil }
        guard let gctValue = dict["generalCulture"] as? Int else { return nil }
        guard let glValue = dict["generalLiteracy"] as? Int else { return nil }
        guard let gbValue = dict["generalBasic"] as? Int else { return nil }
        guard let gpValue = dict["graduationPaper"] as? Bool else { return nil }
        
        englishScore = esValue
        englishLecture = elValue
        serviceTime = stValue
        allCredit = acValue
        majorCredit = mcValue
        majorSpecialty = msValue
        generalCommon = gcValue
        generalCulture = gctValue
        generalLiteracy = glValue
        generalBasic = gbValue
        graduationPaper = gpValue
    }
    
    func toDict() -> [String: Any] {
        return ["englishScore": englishScore,
                "englishLecture": englishLecture,
                "serviceTime": serviceTime,
                "allCredit": allCredit,
                "majorCredit": majorCredit,
                "majorSpecialty": majorSpecialty,
                "generalCommon": generalCommon,
                "generalCulture": generalCulture,
                "generalLiteracy": generalLiteracy,
                "generalBasic": generalBasic,
                "graduationPaper": graduationPaper]
    }
}

extension MyCurriculum: CustomStringConvertible {
    var description: String {
        return "<MyCurri: \(englishScore), \(englishLecture), \(serviceTime), \(allCredit), \(majorCredit), \(majorSpecialty), \(generalCommon), \(generalLiteracy), \(generalBasic),  \(graduationPaper)>"
    }
}
