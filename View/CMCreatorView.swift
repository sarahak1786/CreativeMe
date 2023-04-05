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

struct CMCreatorView: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var allNotes: Notes
    @State private var showEditor: Bool = false
    
    @State private var showTutorial = false
    @State private var title = ""
    @State private var selectedType = ""
    var type: NoteType {
        if selectedType == "Poem" {
            return .poem
        } else if selectedType == "Haiku" {
            return .haiku
        } else if selectedType == "Argumentative Essay" {
            return .argumentativeEssay
        } else if selectedType == "Expository Essay" {
            return .expositoryEssay
        } else if selectedType == "Narrative Essay" {
            return .narrativeEssay
        } else if selectedType == "Informative Essay" {
            return .informativeEssay
        } else if selectedType == "Shakespearean Sonnet" {
            return .shakespeareanSonnet
        } else if selectedType == "Spenserian Sonnet" {
            return .spenserianSonnet
        } else if selectedType == "Play" {
            return .play
        } else if selectedType == "Song" {
            return .song
        } else if selectedType == "Speech" {
            return .speech
        } else {
            return .other
        }
    }
    
    let types = ["Poem", "Haiku", "Argumentative Essay", "Expository Essay", "Narrative Essay", "Informative Essay", "Shakespearean Sonnet", "Spenserian Sonnet", "Play", "Song", "Speech", "Other"]
    
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
                            .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.13)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.50, height: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.17)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title2.bold())
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.22)
                            
                            Text("- Anonymous")
                                .font(.title2)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.245)
                        }
                        
                        GeometryReader { geo in
                            VStack(alignment: .center) {
                                VStack(alignment: .center) {
                                    Text("NAME OF WORK")
                                }
                                
                                TextField("Your creative work...", text: $title)
                                    .font(.title)
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.02)
                                    .padding(20)
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                
                                Text("TYPE OF WRITING")
                                    .padding(.top)
                                
                                Picker("Type", selection: $selectedType) {
                                    ForEach(types, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .background(Color.mainBlue)
                                .cornerRadius(20)
                                .padding(.bottom)
                                .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.15)
                                .pickerStyle(.wheel)
                                
                                Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                                    .padding(.bottom)
                                    .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.05)
                                    .tint(.mainBlue)
                            }
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        }
                        
                        Button("Create New Work") {
                            let note = Note(title: title, body: "Let your mind flow.", type: type, favorites: false)
                            allNotes.add(note)
                            showEditor.toggle()
                            
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.mainPink)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.77)
                        
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.30, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.85)
                    }
                } else if orientation.isLandscape {
                    ZStack {
                        Text("Getting Started")
                            .font(.largeTitle)
                            .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.10)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.50, height: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.15)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title2.bold())
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.20)
                            Text("- Anonymous")
                                .font(.title2)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.23)
                        }
                        
                        GeometryReader { geo in
                            VStack(alignment: .center) {
                                VStack(alignment: .center) {
                                    Text("NAME OF WORK")
                                }
                                
                                TextField("Your creative work...", text: $title)
                                    .font(.title)
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.02)
                                    .padding(20)
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                
                                Text("TYPE OF WRITING")
                                    .padding(.top)
                                
                                Picker("Type", selection: $selectedType) {
                                    ForEach(types, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .background(Color.mainBlue)
                                .cornerRadius(20)
                                .padding(.bottom)
                                .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.15)
                                .pickerStyle(.wheel)
                                
                                Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                                    .padding(.bottom)
                                    .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.05)
                                    .tint(.mainBlue)
                            }
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        }
                        
                        Button("Create New Work") {
                            let note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                            allNotes.add(note)
                            showEditor.toggle()
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.08)
                        .contentShape(Rectangle())
                        .background(Color.mainPink)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.77)
                        
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.30, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.86)
                    }
                } else {
                    ZStack {
                        Text("Getting Started")
                            .font(.largeTitle)
                            .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.08)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.50, height: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.12)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title2.bold())
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.16)
                            
                            Text("- Anonymous")
                                .font(.title2)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.19)
                        }
                        
                        GeometryReader { geo in
                            VStack(alignment: .center) {
                                VStack(alignment: .center) {
                                    Text("NAME OF WORK")
                                }
                                
                                TextField("Your creative work...", text: $title)
                                    .font(.title)
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.02)
                                    .padding(20)
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                
                                Text("TYPE OF WRITING")
                                    .padding(.top)
                                
                                Picker("Type", selection: $selectedType) {
                                    ForEach(types, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .background(Color.mainBlue)
                                .cornerRadius(20)
                                .padding(.bottom)
                                .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.15)
                                .pickerStyle(.wheel)
                                
                                Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                                    .padding(.bottom)
                                    .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.05)
                                    .tint(.mainBlue)
                            }
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        }
                        
                        Button("Create New Work") {
                            let note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                            allNotes.add(note)
                            showEditor.toggle()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.mainPink)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.77)
                        
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.30, height: 70)
                        .contentShape(Rectangle())
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.85)
                    }
                }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        .fullScreenCover(isPresented: $showEditor) {
            CMEditorView(title: allNotes.notes.last?.title ?? "Your Beautiful Work", type: allNotes.notes.last?.type ?? .other, id: allNotes.notes.last?.id ?? UUID())
        }
    }
}

struct CMCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CMCreatorView()
    }
}
