//
//  SaveData.swift
//  DonggukGraduation
//
//  Created by linc on 24/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import Foundation

public class SaveData {
    
    var Point : Int
    var Time : Int
    var Turn_in : Bool
    
    init (Point : Int , Time : Int , Turn_in : Bool)
    {
        self.Point = Point
        self.Time = Time
        self.Turn_in = Turn_in
        
    }
    
}

public var arrSaveData = [SaveData]()
//
//class CurriCulum {
//    var allCredit: Int
//    var majorCredit: Int
//    var generalCredit: Int
//
//}
