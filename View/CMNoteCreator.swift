//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 3/19/23.
//

/*
 Adapt to All Devices of iPad and iOS
 Increase size of button range (create work)
 Accessibility
 Fix UI
 Functionality + Better
 */

import SwiftUI

struct CMNoteCreator: View {
    
    @State private var orientation = UIDeviceOrientation.unknown
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                if orientation.isPortrait {
                    ZStack {
                        Text("Getting Started")
                            .font(.largeTitle)
                            .position(x: geo.frame(in: .local).midX, y: 120)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.50, height: 1)
                            .position(x: geo.frame(in: .local).midX, y: 160)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title2.bold())
                                .position(x: geo.frame(in: .local).midX, y: 230)
                            Text("- Anonymous")
                                .font(.title2)
                                .position(x: geo.frame(in: .local).midX, y: 260)
                        }
                        
                        CMInformationCard()
                        
                        Button("Create New Work") {
                            //Add functionality here!
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.70, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.mainPink)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: 1000)
                    }
                } else if orientation.isLandscape {
                    ZStack {
                        Text("Getting Started")
                            .font(.largeTitle)
                            .position(x: geo.frame(in: .local).midX, y: 120)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.50, height: 1)
                            .position(x: geo.frame(in: .local).midX, y: 160)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title2.bold())
                                .position(x: geo.frame(in: .local).midX, y: 230)
                            Text("- Anonymous")
                                .font(.title2)
                                .position(x: geo.frame(in: .local).midX, y: 260)
                        }
                        
                        CMInformationCard()
                            .position(x: geo.frame(in: .local).midX, y: 300)
                        
                        Button("Create New Work") {
                            //Add functionality here!
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.70, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.mainPink)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: 700)
                    }
                } else {
                    ZStack {
                        Text("Getting Started")
                            .font(.largeTitle)
                            .position(x: geo.frame(in: .local).midX, y: 120)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.50, height: 1)
                            .position(x: geo.frame(in: .local).midX, y: 160)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title2.bold())
                                .position(x: geo.frame(in: .local).midX, y: 230)
                            Text("- Anonymous")
                                .font(.title2)
                                .position(x: geo.frame(in: .local).midX, y: 260)
                        }
                        
                        CMInformationCard()
                        
                        Button("Create New Work") {
                            //Add functionality here!
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.70, height: 70)
                        .background(Color.mainPink)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: 1000)
                    }
                }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct CMInformationCard: View {
    
    @State private var title = ""
    @State private var type = ""
    @State private var showTutorial = false
    
    let types = ["Poem", "Haiku", "Argumentative Essay", "Expository Essay", "Narrative Essay", "Informative Essay", "Shakespearean Sonnet", "Spenserian Sonnet", "Play", "Song", "Speech", "Other"]
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.30)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Text("NAME OF WORK")
                    .position(x: geo.frame(in: .local).midX, y: 430)
                
                TextField("Type here...", text: $title)
                    .frame(width: 490, height: 20)
                    .padding(10)
                    .background(Color.mainBlue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .position(x: geo.frame(in: .local).midX, y: 470)
                
                Text("TYPE OF WRITING")
                    .position(x: geo.frame(in: .local).midX, y: 530)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .background(Color.mainBlue)
                .cornerRadius(30)
                .padding(10)
                .frame(width: 530, height: 100)
                .position(x: geo.frame(in: .local).midX, y: 590)
                .pickerStyle(.wheel)
                
                Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                    .padding()
                    .frame(width: 530, height: 100)
                    .position(x: geo.frame(in: .local).midX, y: 690)
                    .tint(Color.mainBlue)
            }
        }
    }
}

struct CMNoteCreator_Previews: PreviewProvider {
    static var previews: some View {
        CMNoteCreator()
    }
}
