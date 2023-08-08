//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Note Editor View
struct CMEditorView: View {
    
    ///Variables for orientation, color scheme, and accessing user data
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var allNotes: Notes
    
    ///Variables for selected notes and tutorial views
    @Binding var note: Note
    let tutorial: Bool
    
    ///Variables for presenting tutorials based on user selection
    @State private var showPoemTutorial: Bool = false
    @State private var showHaikuTutorial: Bool = false
    @State private var showArgumentativeTutorial: Bool = false
    @State private var showExpositoryTutorial: Bool = false
    @State private var showNarrativeTutorial: Bool = false
    @State private var showInformativeTutorial: Bool = false
    @State private var showSonnetShakeTutorial: Bool = false
    @State private var showSonnetSpenTutorial: Bool = false
    @State private var showPlayTutorial: Bool = false
    @State private var showSongTutorial: Bool = false
    @State private var showSpeechTutorial: Bool = false
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
             ///Optimized for any iPad in Portrait
             if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                 GeometryReader { geo in
                     Text(note.title)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.07)
                         .font(.largeTitle.bold())
                         .foregroundColor(.white)
                     
                     CMTextEditor(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
                         .padding(.bottom, 30)
                     
                     CMSideBarView(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.48)
                 }
                 
             ///Optimized for any iPad in Landscape
             } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                 GeometryReader { geo in
                     Text(note.title)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.08)
                         .font(.largeTitle.bold())
                         .foregroundColor(.white)
                     
                     CMTextEditor(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
                         .padding(.bottom, 30)
                     
                     CMSideBarView(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.48)
                 }
             
             ///Optimized for any iPhone in Portrait
             } else if horizontalSize == .compact && verticalSize == .regular {
                 GeometryReader { geo in
                     Text(note.title)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.09)
                         .font(.title2.bold())
                         .foregroundColor(.white)
                     
                     CMTextEditor(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
                         .padding(.bottom, 30)
                     
                     CMSideBarView(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.48)
                 }
             
             ///Optimized for any iPhone in Landscape
             } else if horizontalSize == .compact && verticalSize == .compact {
                 GeometryReader { geo in
                     Text(note.title)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                         .font(.title.bold())
                         .foregroundColor(.white)
                     
                     CMTextEditor(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.51)
                         .padding(.bottom, 30)
                     
                     CMSideBarView(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.52)
                 }
             
             ///Optimized for any iPhone Pro/Plus Landscape
             } else if horizontalSize == .regular && verticalSize == .compact {
                 GeometryReader { geo in
                     Text(note.title)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                         .font(.title.bold())
                         .foregroundColor(.white)
                     
                     CMTextEditor(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.51)
                         .padding(.bottom, 30)
                     
                     CMSideBarView(note: note)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.52)
                 }
             }
        }
        ///Calls function for tutorial enabled from CMCreatorView
        .onAppear(perform: displayTutorial)
        
        ///Presents tutorials according to user selection
        .fullScreenCover(isPresented: $showPoemTutorial, content: CMPoemView.init)
        .fullScreenCover(isPresented: $showHaikuTutorial, content: CMHaikuView.init)
        .fullScreenCover(isPresented: $showArgumentativeTutorial) {
            CMEssayView(essayType: NoteType.argumentativeEssay)
        }
        .fullScreenCover(isPresented: $showExpositoryTutorial) {
            CMEssayView(essayType: NoteType.expositoryEssay)
        }
        .fullScreenCover(isPresented: $showNarrativeTutorial) {
            CMEssayView(essayType: NoteType.narrativeEssay)
        }
        .fullScreenCover(isPresented: $showInformativeTutorial) {
            CMEssayView(essayType: NoteType.informativeEssay)
        }
        .fullScreenCover(isPresented: $showSonnetShakeTutorial) {
            CMSonnetView(sonnetType: NoteType.shakespeareanSonnet)
        }
        .fullScreenCover(isPresented: $showSonnetSpenTutorial) {
            CMSonnetView(sonnetType: NoteType.spenserianSonnet)
        }
        .fullScreenCover(isPresented: $showPlayTutorial, content: CMPlayView.init)
        .fullScreenCover(isPresented: $showSongTutorial, content: CMSongView.init)
        .fullScreenCover(isPresented: $showSpeechTutorial, content: CMSpeechView.init)
        .environmentObject(OrientationInfo())
    }
    
    ///Sets boolean value true based on type selected
    func displayTutorial() {
        if tutorial == true {
            if note.type == .poem {
                showPoemTutorial.toggle()
            } else if note.type == .haiku {
                showHaikuTutorial.toggle()
            } else if note.type == .argumentativeEssay {
                showArgumentativeTutorial.toggle()
            } else if note.type == .expositoryEssay {
                showExpositoryTutorial.toggle()
            } else if note.type == .informativeEssay {
                showInformativeTutorial.toggle()
            } else if note.type == .narrativeEssay {
                showNarrativeTutorial.toggle()
            } else if note.type == .shakespeareanSonnet {
                showSonnetShakeTutorial.toggle()
            } else if note.type == .spenserianSonnet {
                showSonnetSpenTutorial.toggle()
            } else if note.type == .play {
                showPlayTutorial.toggle()
            } else if note.type == .song {
                showSongTutorial.toggle()
            } else if note.type == .speech {
                showSpeechTutorial.toggle()
            }
        }
    }
}

//MARK: Text Editor View
struct CMTextEditor: View {
    
    ///Variables for orientation, color scheme, and accessing user data
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var allNotes: Notes
    
    ///Variable for given note selected from another view
    let note: Note
    
    ///Variables for main text body, save note notification, and presenting notification
    @State private var bodyText = "Let your mind flow."
    @State private var saveData: CMCustomSaveView.SaveView = CMCustomSaveView.SaveView(title: "Saved!", font: .title2, foregroundColor: .mainPink, backgroundColor: .white.opacity(0.6))
    @State private var saveAppear: Bool = false
    
    ///Sets color of textEditor based on colorScheme and initializes note
    init(note: Note) {
        UITextView.appearance().backgroundColor = .red
        self.note = note
    }
    
    var body: some View {
        ZStack {
            
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    if #available(iOS 16.0, *) {
                        TextEditor(text: $bodyText)
                            .font(.title2)
                            .scrollContentBackground(.hidden)
                            .background(colorScheme == .dark ? Color.mainGray : .white)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.59)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        TextEditor(text: $bodyText)
                            .font(.title2)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.59)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    Button("Save Work") {
                        allNotes.saveBody(note, bodyText)
                        saveAppear.toggle()
                    }
                    .font(.title3)
                    .cornerRadius(10)
                    .colorScheme(.light)
                    .foregroundColor(.mainPink)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.32)
                    .buttonStyle(.bordered)
                    .saveView(save: $saveData, appear: $saveAppear)
                }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    if #available(iOS 16.0, *) {
                        TextEditor(text: $bodyText)
                            .font(.title2)
                            .scrollContentBackground(.hidden)
                            .background(colorScheme == .dark ? Color.mainGray : .white)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.65)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        TextEditor(text: $bodyText)
                            .font(.title2)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.65)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    Button("Save Work") {
                        allNotes.saveBody(note, bodyText)
                        saveAppear.toggle()
                    }
                    .font(.title3)
                    .cornerRadius(10)
                    .colorScheme(.light)
                    .foregroundColor(.mainPink)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.3)
                    .buttonStyle(.bordered)
                    .saveView(save: $saveData, appear: $saveAppear)
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    if #available(iOS 16.0, *) {
                        TextEditor(text: $bodyText)
                            .font(.headline)
                            .fontWeight(.regular)
                            .scrollContentBackground(.hidden)
                            .background(colorScheme == .dark ? Color.mainGray : .white)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.58)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        TextEditor(text: $bodyText)
                            .font(.headline)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.58)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    Button("Save Work") {
                        allNotes.saveBody(note, bodyText)
                        saveAppear.toggle()
                    }
                    .font(.headline)
                    .cornerRadius(10)
                    .colorScheme(.light)
                    .foregroundColor(.mainPink)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.31)
                    .buttonStyle(.bordered)
                    .saveView(save: $saveData, appear: $saveAppear)
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    if #available(iOS 16.0, *) {
                        TextEditor(text: $bodyText)
                            .font(.headline)
                            .fontWeight(.regular)
                            .scrollContentBackground(.hidden)
                            .background(colorScheme == .dark ? Color.mainGray : .white)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.54)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        TextEditor(text: $bodyText)
                            .font(.title2)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.54)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    Button("Save Work") {
                        allNotes.saveBody(note, bodyText)
                        saveAppear.toggle()
                    }
                    .font(.headline)
                    .cornerRadius(10)
                    .colorScheme(.light)
                    .foregroundColor(.mainPink)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.25)
                    .buttonStyle(.bordered)
                    .saveView(save: $saveData, appear: $saveAppear)
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(50)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    if #available(iOS 16.0, *) {
                        TextEditor(text: $bodyText)
                            .font(.headline)
                            .fontWeight(.regular)
                            .scrollContentBackground(.hidden)
                            .background(colorScheme == .dark ? Color.mainGray : .white)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.54)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } else {
                        TextEditor(text: $bodyText)
                            .font(.title2)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.54)
                            .cornerRadius(10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    Button("Save Work") {
                        allNotes.saveBody(note, bodyText)
                        saveAppear.toggle()
                    }
                    .font(.headline)
                    .cornerRadius(10)
                    .colorScheme(.light)
                    .foregroundColor(.mainPink)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.25)
                    .buttonStyle(.bordered)
                    .saveView(save: $saveData, appear: $saveAppear)
                }
            }
        }
        ///Sets currrent text body to user saved body
        .onAppear(perform: setBody)
    }
    
    ///Gets the selected note's text body
    func setBody() {
        bodyText = allNotes.getBody(note)
    }
}

//MARK: Editor Side Bar View
struct CMSideBarView: View {

    ///Variables for orientation, color scheme, and accessing user data
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var allNotes: Notes
    
    ///Variables for selected notes and tutorial views
    let note: Note
    
    ///Get-only variable converting between NoteType to String
    var typeString: String {
        if note.type == .poem {
            return "Poem"
        } else if note.type == .haiku {
            return "Haiku"
        } else if note.type == .argumentativeEssay {
            return "Argumentative Essay"
        } else if note.type == .expositoryEssay {
            return "Expository Essay"
        } else if note.type == .informativeEssay {
            return "Informative Essay"
        } else if note.type == .narrativeEssay {
            return "Narratve Essay"
        } else if note.type == .shakespeareanSonnet {
            return "Shakespearean Sonnet"
        } else if note.type == .spenserianSonnet {
            return "Spenserian Sonnet"
        } else if note.type == .play {
            return "Play"
        } else if note.type == .song {
            return "Song"
        } else if note.type == .speech {
            return "Speech"
        } else {
            return "Other"
        }
    }
    
    ///Variables for favorite note selection and presenting an alert
    @State private var favoriteNote: Bool = true
    @State private var deleteAlert = false
    
    var body: some View {
        ZStack {
            
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    }
                    
                    HStack {
                        Button() {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.09, height: geo.size.height * 0.09)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityLabel("Back")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.30, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Button() {
                            setFavorite(note)
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(favoriteNote ? .yellow : .clear)
                                    .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                
                                Image(systemName: "bookmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.06, height: geo.size.height * 0.06)
                                    .foregroundColor(.purpleSave)
                                    .colorScheme(.light)
                                    .accessibilityLabel("Save to favorites")
                            }
                        }
                        .position(x: geo.frame(in: .local).midX * 0.02, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Text("Type: \(typeString)")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.06)
                            .background(Color.mainBlue)
                            .cornerRadius(100)
                            .position(x: geo.frame(in: .local).midX * 0.06, y: geo.frame(in: .local).maxY * 0.92)
                            .padding(.trailing)
                            .accessibilityLabel("This note is of type \(typeString)")
                        
                        Button() {
                            deleteAlert.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.09, height: geo.size.height * 0.09)
                                .foregroundColor(.mainRed)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityLabel("Delete note")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.15, y: geo.frame(in: .local).maxY * 0.92)
                    }
                }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    }
                    
                    HStack {
                        Button() {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.075, height: geo.size.height * 0.075)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityLabel("Back")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.25, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Button() {
                            setFavorite(note)
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(favoriteNote ? .yellow : .clear)
                                    .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                
                                Image(systemName: "bookmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                    .foregroundColor(.purpleSave)
                                    .colorScheme(.light)
                                    .accessibilityLabel("Save to favorites")
                            }
                        }
                        .position(x: geo.frame(in: .local).maxX * 0.12, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Text("Type: \(typeString)")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.06)
                            .background(Color.mainBlue)
                            .cornerRadius(100)
                            .position(x: geo.frame(in: .local).midX * 0.22, y: geo.frame(in: .local).maxY * 0.92)
                            .padding(.trailing)
                            .accessibilityLabel("This note is of type \(typeString)")
                        
                        Button() {
                            deleteAlert.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.075, height: geo.size.height * 0.075)
                                .foregroundColor(.mainRed)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityLabel("Delete note")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.22, y: geo.frame(in: .local).maxY * 0.92)
                    }
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    }
                    
                    HStack {
                        Button() {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.11, height: geo.size.height * 0.11)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityLabel("Back")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.33, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Button() {
                            setFavorite(note)
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(favoriteNote ? .yellow : .clear)
                                    .frame(width: geo.size.width * 0.09, height: geo.size.height * 0.09)
                                
                                Image(systemName: "bookmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.09, height: geo.size.height * 0.09)
                                    .foregroundColor(.purpleSave)
                                    .colorScheme(.light)
                                    .accessibilityLabel("Save to favorites")
                            }
                        }
                        .position(x: geo.frame(in: .local).midX * 0.06, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Text("Type: \(typeString)")
                            .font(.caption2.bold())
                            .foregroundColor(.white)
                            .padding(5)
                            .frame(width: geo.size.width * 0.39, height: geo.size.height * 0.055)
                            .background(Color.mainBlue)
                            .cornerRadius(100)
                            .position(x: geo.frame(in: .local).midX * 0.08, y: geo.frame(in: .local).maxY * 0.92)
                            .padding(.trailing)
                            .accessibilityLabel("This note is of type \(typeString)")
                        
                        Button() {
                            deleteAlert.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.11, height: geo.size.height * 0.11)
                                .foregroundColor(.mainRed)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityLabel("Delete note")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.12, y: geo.frame(in: .local).maxY * 0.92)
                    }
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.15)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.15)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    }
                    
                    HStack {
                        Button() {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.11, height: geo.size.height * 0.11)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityLabel("Back")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.25, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Button() {
                            setFavorite(note)
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(favoriteNote ? .yellow : .clear)
                                    .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.08)
                                
                                Image(systemName: "bookmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.08)
                                    .foregroundColor(.purpleSave)
                                    .colorScheme(.light)
                                    .accessibilityLabel("Save to favorites")
                            }
                        }
                        .position(x: geo.frame(in: .local).minX - 50, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Text("Type: \(typeString)")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.30, height: geo.size.height * 0.09)
                            .background(Color.mainBlue)
                            .cornerRadius(100)
                            .position(x: geo.frame(in: .local).midX * 0.35, y: geo.frame(in: .local).maxY * 0.92)
                            .padding(.trailing)
                            .accessibilityLabel("This note is of type \(typeString)")
                        
                        Button() {
                            deleteAlert.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.11, height: geo.size.height * 0.11)
                                .foregroundColor(.mainRed)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityLabel("Delete note")
                        }
                        .position(x: geo.frame(in: .local).maxX * 0.115, y: geo.frame(in: .local).maxY * 0.92)
                    }
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                GeometryReader { geo in
                    if #available(iOS 16.0, *) {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.15)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    } else {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .cornerRadius(100)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.15)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                    }
                    
                    HStack {
                        Button() {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.11, height: geo.size.height * 0.11)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityLabel("Back")
                        }
                        .position(x: geo.frame(in: .local).midX * 0.25, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Button() {
                            setFavorite(note)
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(favoriteNote ? .yellow : .clear)
                                    .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.08)
                                
                                Image(systemName: "bookmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.08, height: geo.size.height * 0.08)
                                    .foregroundColor(.purpleSave)
                                    .colorScheme(.light)
                                    .accessibilityLabel("Save to favorites")
                            }
                        }
                        .position(x: geo.frame(in: .local).minX - 50, y: geo.frame(in: .local).maxY * 0.92)
                        
                        Text("Type: \(typeString)")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.30, height: geo.size.height * 0.09)
                            .background(Color.mainBlue)
                            .cornerRadius(100)
                            .position(x: geo.frame(in: .local).midX * 0.35, y: geo.frame(in: .local).maxY * 0.92)
                            .padding(.trailing)
                            .accessibilityLabel("This note is of type \(typeString)")
                        
                        Button() {
                            deleteAlert.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.11, height: geo.size.height * 0.11)
                                .foregroundColor(.mainRed)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityLabel("Delete note")
                        }
                        .position(x: geo.frame(in: .local).maxX * 0.115, y: geo.frame(in: .local).maxY * 0.92)
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        
        ///Presents an alert before deleting a note
        .alert(isPresented: $deleteAlert) {
            Alert(
                title: Text("Delete '\(allNotes.getTitle(note))'?"),
                message: Text("This cannot be recovered."),
                primaryButton: .destructive(Text("Delete")) {
                    allNotes.delete(note)
                    dismiss()
                },
                secondaryButton: .cancel()
            )
        }
        
        ///Sets favorite note icon based on boolean value
        .onAppear {
            favoriteNote = allNotes.getFavorites(note)
        }
    }
    
    ///Resets the favorites boolean of a given note selected
    func setFavorite(_ note: Note) {
        allNotes.addFavorites(note)
        favoriteNote = allNotes.getFavorites(note)
    }
}

//MARK: Note Editor View Preview
struct CMEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CMEditorView(note: .constant(Note(title: "Sample Note", body: "This is your body!", type: .argumentativeEssay, favorites: true)), tutorial: false)
            .environmentObject(OrientationInfo())
            .environmentObject(Notes())
    }
}
