//
//  MyApp.swift
//
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

@main
struct MyApp: App {
    
    ///Variable for storing initial run to UserDefaults
    @AppStorage("firstRun") var firstRun: Bool = true
    
    var body: some Scene {
        WindowGroup {
            CMContentView(firstRun: $firstRun)
                .environmentObject(OrientationInfo())
        }
    }
}
