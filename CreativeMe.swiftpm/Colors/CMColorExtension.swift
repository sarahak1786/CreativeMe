//
//  ColorExtension.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Custom Application Colors
extension Color {
    
    ///Globally used colors for buttons, icons, and more
    static let mainBlue = Color("BKBlue")
    static let mainPink = Color("BKPink")
    static let mainGray = Color("BKGray")
    static let mainRed = Color("DeleteRed")
    
    ///Globally used dark versioned color for buttons, icons, and more
    static let darkBlue = Color("DarkBlue")
    static let darkPink = Color("DarkPink")
    static let darkPurple = Color("DarkPurple")
    
    ///Globally used colors for main icon bar colors (named after each)
    static let purpleLearn = Color("PurpleLearn")
    static let purpleRandom = Color("PurpleRandom")
    static let purpleSave = Color("PurpleSave")
    static let blueButton = Color("BlueButton")
    
    ///Main background gradient color for all views
    static let backgroundGradient =  LinearGradient(gradient: Gradient(colors: [mainBlue, mainPink]), startPoint: .top, endPoint: .bottom)
}
