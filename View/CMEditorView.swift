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
    
    let title: String
    let type: NoteType
    let id: UUID
    
    @State private var hint: Bool = false
    var hintString: String {
        if type == .poem {
            return "Poems may contain any form of rhyme!"
        } else if type == .haiku {
            return "A haiku has a 5-7-5 rhyme scheme!"
        } else if type == .argumentativeEssay {
            return "Your claim can be subjective!"
        } else if type == .expositoryEssay {
            return "Your claim must not be subjective!"
        } else if type == .informativeEssay {
            return "Your essay must include research!"
        } else if type == .narrativeEssay {
            return "Your essay may replicate a plot stucture!"
        } else if type == .shakespeareanSonnet {
            return "Rhyme scheme: ABAB-CDCD-EFEF-GG"
        } else if type == .spenserianSonnet {
            return "Rhyme scheme: ABAB-BCBC-CDCD-EE"
        } else if type == .play {
            return "Your play may include stage directions."
        } else if type == .song {
            return "Don't forget to add a bridge!"
        } else if type == .speech {
            return "Include a quote at the end!"
        } else {
            return "No tips for this one. You got this!"
        }
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Text(title)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.05)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                CMTextEditor(id: id)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
                    .padding(.bottom, 30)
                
                CMSideBarView(id: id)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.48)
                
                Button("Print") {
                    print("This is selected on EditorView from main\(id)")
                }
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
            }
        }
    }
}

struct CMTextEditor: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var allNotes: Notes
    @State private var bodyText = "Let your mind flow."
    let id: UUID
    
    init(id: UUID) {
        UITextView.appearance().backgroundColor = .red
        self.id = id
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(50)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(50)
                        .shadow(radius: 20)
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
                    for i in 0..<allNotes.notes.count {
                        if allNotes.notes[i].id == id {
                            allNotes.notes[i].body = bodyText
                        }
                    }
                }
                .font(.title2)
                .cornerRadius(10)
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.3)
            }
        }
        .onAppear(perform: printID)
        .onAppear(perform: setBody)
    }
    
    func setBody() {
        for i in 0..<allNotes.notes.count {
            if allNotes.notes[i].id == id {
                bodyText = allNotes.notes[i].body
            } else {
                bodyText = "Let your mind explore the realm of writing."
            }
        }
    }
    
    func printID() {
        print("This is selected on editor from button before taking in\(id)")
    }
}

struct CMSideBarView: View {
    
    @EnvironmentObject var allNotes: Notes
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @State private var favorites: Bool = false
    @State private var type: NoteType = .poem
    let id: UUID
    
    var typeString: String {
        if type == .poem {
            return "Poem"
        } else if type == .haiku {
            return "Haiku"
        } else if type == .argumentativeEssay {
            return "Argumentative Essay"
        } else if type == .expositoryEssay {
            return "Expository Essay"
        } else if type == .informativeEssay {
            return "Informative Essay"
        } else if type == .narrativeEssay {
            return "Narratve Essay"
        } else if type == .shakespeareanSonnet {
            return "Shakespearean Sonnet"
        } else if type == .spenserianSonnet {
            return "Spenserian Sonnet"
        } else if type == .play {
            return "Play"
        } else if type == .song {
            return "Song"
        } else if type == .speech {
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
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
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
                            .frame(width: geo.size.width * 0.09, height: geo.size.height)
                            .foregroundColor(.mainPink)
                            .colorScheme(.light)
                    }
                    .position(x: geo.frame(in: .local).midX * 0.30, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Button() {
                        setFavorite()
                        //Have it reflect if saved or not
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(favorites ? .yellow : .clear)
                                .frame(width: geo.size.width * 0.05, height: geo.size.height)
                            
                            Image(systemName: "bookmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.05, height: geo.size.height)
                                .foregroundColor(.purpleSave)
                                .colorScheme(.light)
                        }
                        .onTapGesture {
                            withAnimation {
                                favorites.toggle()
                            }
                        }
                    }
                    .position(x: geo.frame(in: .local).midX * 0.07, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Text("Type: \(typeString)")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.20, height: geo.size.height * 0.05)
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
                            .frame(width: geo.size.width * 0.09, height: geo.size.height)
                            .foregroundColor(.purpleLearn)
                            .colorScheme(.light)
                            .padding()
                    }
                    .position(x: geo.frame(in: .local).midX * 0.05, y: geo.frame(in: .local).maxY * 0.92)
                }
            }
        }
        .onAppear(perform: setText)
    }
    
    func setText() {
        for i in 0..<allNotes.notes.count {
            if allNotes.notes[i].id == id {
                type = allNotes.notes[i].type
            } else {
                type = .other
            }
        }
    }
    
    func setFavorite() {
        for i in 0..<allNotes.notes.count {
            if allNotes.notes[i].id == id {
                allNotes.notes[i].favorites.toggle()
            }
        }
    }
}

struct CMEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CMEditorView(title: "", type: .argumentativeEssay, id: UUID())
    }
}
