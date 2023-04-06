//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 3/18/23.
//

import SwiftUI

struct CMEditorView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var allNotes: Notes
    
    let note: Note
    let tutorial: Bool
    
    @State private var hint: Bool = false
    var hintString: String {
        if note.type == .poem {
            return "Poems may contain any form of rhyme!"
        } else if note.type == .haiku {
            return "A haiku has a 5-7-5 rhyme scheme!"
        } else if note.type == .argumentativeEssay {
            return "Your claim can be subjective!"
        } else if note.type == .expositoryEssay {
            return "Your claim must not be subjective!"
        } else if note.type == .informativeEssay {
            return "Your essay must include research!"
        } else if note.type == .narrativeEssay {
            return "Your essay may replicate a plot stucture!"
        } else if note.type == .shakespeareanSonnet {
            return "Rhyme scheme: ABAB-CDCD-EFEF-GG"
        } else if note.type == .spenserianSonnet {
            return "Rhyme scheme: ABAB-BCBC-CDCD-EE"
        } else if note.type == .play {
            return "Your play may include stage directions."
        } else if note.type == .song {
            return "Don't forget to add a bridge!"
        } else if note.type == .speech {
            return "Include a quote at the end!"
        } else {
            return "No tips for this one. You got this!"
        }
    }
    
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
            
            GeometryReader { geo in
                Text(note.title)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.05)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                CMTextEditor(note: note)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
                    .padding(.bottom, 30)
                
                CMSideBarView(note: note)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.48)
            }
        }
        .onAppear(perform: displayTutorial)
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
    }
    
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

struct CMTextEditor: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var allNotes: Notes
    let note: Note
    
    @State private var bodyText = "Let your mind flow."
    
    init(note: Note) {
        UITextView.appearance().backgroundColor = .red
        self.note = note
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(50)
//                        .shadow(radius: 5)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(50)
//                        .shadow(radius: 5)
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
                }
                .font(.title2)
                .cornerRadius(10)
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.3)
            }
        }
        .onAppear(perform: setBody)
    }
    
    func setBody() {
        bodyText = allNotes.getBody(note)
    }
}

struct CMSideBarView: View {
    
    @EnvironmentObject var allNotes: Notes
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    let note: Note
    
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
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(100)
//                        .shadow(radius: 5)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
//                        .shadow(radius: 5)
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
                    }
                    .position(x: geo.frame(in: .local).midX * 0.30, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Button() {
                        allNotes.addFavorites(note)
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(note.favorites ? .yellow : .clear)
                                .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                            
                            Image(systemName: "bookmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.05, height: geo.size.height * 0.05)
                                .foregroundColor(.purpleSave)
                                .colorScheme(.light)
                        }
                    }
                    .position(x: geo.frame(in: .local).midX * 0.07, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Text("Type: \(typeString)")
                        .font(.headline.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.20, height: geo.size.height * 0.03)
                        .background(Color.mainBlue)
                        .cornerRadius(100)
                        .position(x: geo.frame(in: .local).midX * 0.25, y: geo.frame(in: .local).maxY * 0.92)
                        .padding(.trailing)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image(systemName: "theatermasks.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.09, height: geo.size.height * 0.09)
                            .foregroundColor(.purpleLearn)
                            .colorScheme(.light)
                            .padding()
                    }
                    .position(x: geo.frame(in: .local).midX * 0.05, y: geo.frame(in: .local).maxY * 0.92)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct CMEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CMEditorView(note: Note(title: "Preview Note", body: "This is it!", type: .poem, favorites: false), tutorial: false)
    }
}
