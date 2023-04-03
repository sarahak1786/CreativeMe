//
//  ColorExtension.swift
//  
//
//  Created by Sarah Akhtar on 3/18/23.
//

import SwiftUI

//MARK: Added Colors
extension Color {
    static let mainBlue = Color("BKBlue")
    static let mainPink = Color("BKPink")
    static let mainGray = Color("BKGray")
    
    static let purpleLearn = Color("PurpleLearn")
    static let purpleRandom = Color("PurpleRandom")
    static let purpleSave = Color("PurpleSave")
    static let blueButton = Color("BlueButton")
    
    static let backgroundGradient =  LinearGradient(gradient: Gradient(colors: [mainBlue, mainPink]), startPoint: .top, endPoint: .bottom)
}
