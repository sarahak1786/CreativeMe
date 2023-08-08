//  CMContentView.swift
//
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Content View
struct CMContentView: View {
    
    ///Variable for showing view based on initial run
    @Binding var firstRun: Bool
    
    var body: some View {
        VStack {
            if firstRun {
                CMHomeView(firstRun: $firstRun)
            } else {
                CMHomeView(firstRun: $firstRun)
            }
        }
    }
}

//MARK: Content View Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CMContentView(firstRun: .constant(true))
    }
}
