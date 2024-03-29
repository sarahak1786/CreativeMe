//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Note Creator View
struct CMCreatorView: View {
    
    ///Variables for orientation, color scheme, and accessing user data
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var allNotes: Notes
    
    ///Variables for sample note and presenting CMEditorView, disabling creation button, and showing tutorials
    @State private var showEditor: Bool = false
    @State private var disableCreate: Bool = false
    @State private var showTutorial: Bool = false
    @State private var note: Note = Note(title: "Sample Title", body: "Start typing...", type: .poem, favorites: false)
    
    ///Variable for the given allowed types for NoteType
    let types = ["Poem", "Haiku", "Argumentative Essay", "Expository Essay", "Narrative Essay", "Informative Essay", "Shakespearean Sonnet", "Spenserian Sonnet", "Play", "Song", "Speech", "Other"]
    
    ///Variables for title name, selected type, and conversion from String to NoteType
    @State private var title = ""
    @State private var selectedType = "Poem"
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
    
    ///Get-only variable for disabling based on type option
    var disableOther: Bool {
        if selectedType == "Other" {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
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
                            .accessibilityElement(children: .ignore)
                            
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
                                        .disabled(disableOther == true)
                                }
                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                                
                                Button("Create New Work") {
                                    note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                                    allNotes.add(note)
                                    showEditor.toggle()
                                    disableCreate = true
                                }
                                .font(.title.bold())
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.60, height: 70)
                                .contentShape(Rectangle())
                                .background(disableCreate ? Color.gray : Color.mainPink)
                                .cornerRadius(20)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.77)
                                .disabled(disableCreate == true)
                                
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
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
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
                            .accessibilityElement(children: .ignore)
                            
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
                                        .disabled(disableOther == true)
                                }
                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                                
                                Button("Create New Work") {
                                    note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                                    allNotes.add(note)
                                    showEditor.toggle()
                                    disableCreate = true
                                }
                                .font(.title.bold())
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.50, height: 55)
                                .contentShape(Rectangle())
                                .background(disableCreate ? Color.gray : Color.mainPink)
                                .cornerRadius(20)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.77)
                                .disabled(disableCreate == true)
                                
                                Button("Cancel") {
                                    dismiss()
                                }
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.20, height: 35)
                                .contentShape(Rectangle())
                                .background(Color.purpleRandom)
                                .cornerRadius(20)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.85)
                        }
                    }
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                        ZStack {
                            Text("Getting Started")
                                .font(.title)
                                .fontWeight(.thin)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.08)
                            
                            Rectangle()
                                .frame(width: geo.size.width * 0.60, height: 1)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.12)
                            
                            ZStack(alignment: .leading) {
                                Text("\"Where the world meets ingenuity\"")
                                    .font(.title3.bold())
                                    .frame(width: 300, height: 100)
                                    .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.19)
                                
                                Text("- Anonymous")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.245)
                            }
                            .accessibilityElement(children: .ignore)
                            
                            GeometryReader { geo in
                                VStack(alignment: .center) {
                                    VStack(alignment: .center) {
                                        Text("NAME OF WORK")
                                            .font(.caption)
                                    }
                                    
                                    TextField("Your creative work...", text: $title)
                                        .font(.headline)
                                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.02)
                                        .padding(20)
                                        .background(Color.mainBlue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                    
                                    Text("TYPE OF WRITING")
                                        .font(.caption)
                                        .padding(.top)
                                    
                                    Picker("Type", selection: $selectedType) {
                                        ForEach(types, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .background(Color.mainBlue)
                                    .cornerRadius(20)
                                    .padding(.bottom)
                                    .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.16)
                                    .pickerStyle(.wheel)
                                    
                                    Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                                        .font(.caption)
                                        .padding(.bottom)
                                        .frame(width: geo.size.width * 0.54, height: geo.size.height * 0.05)
                                        .tint(.mainBlue)
                                        .disabled(disableOther == true)
                                }
                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + 20)
                                
                                Button("Create New Work") {
                                    note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                                    allNotes.add(note)
                                    showEditor.toggle()
                                    disableCreate = true
                                }
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.60, height: 40)
                                .contentShape(Rectangle())
                                .background(disableCreate ? Color.gray : Color.mainPink)
                                .cornerRadius(20)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.81)
                                .disabled(disableCreate == true)
                                
                                Button("Cancel") {
                                    dismiss()
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.25, height: 30)
                                .contentShape(Rectangle())
                                .background(Color.purpleRandom)
                                .cornerRadius(20)
                                .position(x: geo.frame(in: .local).midX, y: geo.size.height * 0.89)
                        }
                    }
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.9)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    ZStack {
                        Text("Getting Started")
                            .font(.title)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.20)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.33, height: 1)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.27)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title3.bold())
                                .frame(width: 300, height: 100)
                                .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.38)
                            
                            Text("- Anonymous")
                                .font(.headline)
                                .fontWeight(.medium)
                                .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.50)
                        }
                        .accessibilityElement(children: .ignore)
                        
                        GeometryReader { geo in
                            VStack(alignment: .center) {
                                VStack(alignment: .center) {
                                    Text("NAME OF WORK")
                                        .font(.caption)
                                }
                                
                                TextField("Your creative work...", text: $title)
                                    .font(.headline)
                                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.02)
                                    .padding(20)
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                
                                Text("TYPE OF WRITING")
                                    .font(.caption)
                                    .padding(.top)
                                
                                Picker("Type", selection: $selectedType) {
                                    ForEach(types, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .background(Color.mainBlue)
                                .cornerRadius(20)
                                .padding(.bottom)
                                .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.3)
                                .pickerStyle(.wheel)
                                
                                Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                                    .font(.caption)
                                    .padding(.bottom)
                                    .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.1)
                                    .tint(.mainBlue)
                                    .disabled(disableOther == true)
                            }
                            .position(x: geo.frame(in: .local).midX - 140, y: geo.frame(in: .local).midY + 12)
                            
                            Button("Create New Work") {
                                note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                                allNotes.add(note)
                                showEditor.toggle()
                                disableCreate = true
                            }
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.30, height: 40)
                            .contentShape(Rectangle())
                            .background(disableCreate ? Color.gray : Color.mainPink)
                            .cornerRadius(20)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.65)
                            .disabled(disableCreate == true)
                            
                            Button("Cancel") {
                                dismiss()
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.25, height: 30)
                            .contentShape(Rectangle())
                            .background(Color.purpleRandom)
                            .cornerRadius(20)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.8)
                    }
                }
            }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.9)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    ZStack {
                        Text("Getting Started")
                            .font(.title)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.20)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.33, height: 1)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.27)
                        
                        ZStack(alignment: .leading) {
                            Text("\"Where the world meets ingenuity\"")
                                .font(.title3.bold())
                                .frame(width: 300, height: 100)
                                .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.38)
                            
                            Text("- Anonymous")
                                .font(.headline)
                                .fontWeight(.medium)
                                .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.50)
                        }
                        .accessibilityElement(children: .ignore)
                        
                        GeometryReader { geo in
                            VStack(alignment: .center) {
                                VStack(alignment: .center) {
                                    Text("NAME OF WORK")
                                        .font(.caption)
                                }
                                
                                TextField("Your creative work...", text: $title)
                                    .font(.headline)
                                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.02)
                                    .padding(20)
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                
                                Text("TYPE OF WRITING")
                                    .font(.caption)
                                    .padding(.top)
                                
                                Picker("Type", selection: $selectedType) {
                                    ForEach(types, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .background(Color.mainBlue)
                                .cornerRadius(20)
                                .padding(.bottom)
                                .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.3)
                                .pickerStyle(.wheel)
                                
                                Toggle("ENABLE TUTORIAL", isOn: $showTutorial)
                                    .font(.caption)
                                    .padding(.bottom)
                                    .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.1)
                                    .tint(.mainBlue)
                                    .disabled(disableOther == true)
                            }
                            .position(x: geo.frame(in: .local).midX - 140, y: geo.frame(in: .local).midY + 12)
                            
                            Button("Create New Work") {
                                note = Note(title: title, body: "Let your mind wander.", type: type, favorites: false)
                                allNotes.add(note)
                                showEditor.toggle()
                                disableCreate = true
                            }
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.30, height: 40)
                            .contentShape(Rectangle())
                            .background(disableCreate ? Color.gray : Color.mainPink)
                            .cornerRadius(20)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.65)
                            .disabled(disableCreate == true)
                            
                            Button("Cancel") {
                                dismiss()
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.25, height: 30)
                            .contentShape(Rectangle())
                            .background(Color.purpleRandom)
                            .cornerRadius(20)
                            .position(x: geo.frame(in: .local).midX + 180, y: geo.size.height * 0.8)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .environmentObject(OrientationInfo())
        
        ///Presents CMEditorView based on boolean
        .fullScreenCover(isPresented: $showEditor) {
            CMEditorView(note: $note, tutorial: showTutorial)
        }
    }
}

//MARK: Note Creator View Preview
struct CMCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CMCreatorView()
            .environmentObject(OrientationInfo())
    }
}
