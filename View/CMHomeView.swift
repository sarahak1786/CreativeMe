//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/1/23.
//

import SwiftUI

struct CMHomeView: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @StateObject var allNotes = Notes()
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Color.backgroundGradient
                    .ignoresSafeArea()
        
                GeometryReader { geo in
                    Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
//                        .shadow(radius: 5)
                    
                    CMNoteView()
                        .contentShape(Capsule())
                        .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.80)
                    
                    CMInfoBarView()
                        .position(x: geo.frame(in: .local).midX * 1.6, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                    
                    CMAddNote()
                        .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.40)
                    
                    Rectangle()
                        .frame(width: geo.size.width * 0.50, height: 1)
                        .foregroundColor(.white)
                        .position(x: geo.frame(in: .local).midX * 0.77, y: geo.frame(in: .local).minY + geo.size.height * 0.63)
                }
            }
        }
        .environmentObject(allNotes)
    }
}

struct CMAddNote: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showCreatorView: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                .cornerRadius(20)
//                .shadow(radius: 5)
                .frame(width: 500, height: 500)
            
            Button() {
                showCreatorView.toggle()
            } label: {
                VStack {
                    Text("+")
                        .foregroundColor(.primary)
                        .font(.system(size: 100))
                        .fontWeight(.thin)
                    Text("New Note")
                        .foregroundColor(.primary)
                        .font(.system(size: 45))
                        .fontWeight(.thin)
                }
            }
            .frame(width: 500, height: 500)
            .contentShape(Rectangle())
            .onTapGesture {
                showCreatorView.toggle()
            }
        }
        .fullScreenCover(isPresented: $showCreatorView, content: CMCreatorView.init)
    }
}

struct CMNoteView: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var allNotes: Notes
    
    @State private var selectedType: String = "Poem"
    @State private var filter: FilterType = .alphabetical
    
    enum FilterType {
        case type, alphabetical, favorites
    }
    
    var filteredNotes: [Note] {
        switch filter {
        case .type:
            return allNotes.notes.filter {typesFiltered == $0.type ? true : false}
        case .alphabetical:
            return allNotes.notes.sorted {$0.title < $1.title}
        case .favorites:
            return allNotes.notes.filter {$0.favorites}
        }
    }
    
    let pickFilter = ["Type", "Alphabetical"]
    var typesFiltered: NoteType {
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
    
    @State private var currentIndex = 0
    @State private var index = 0
    var controls: some View {
        HStack {
            Button {
                previous()
            } label: {
                Image(systemName: "chevron.left.circle.fill")
                    .accessibilityHidden(true)
            }
            Spacer()
                .frame(width: 80, height: 30)
            
            Button {
                next()
            } label: {
                Image(systemName: "chevron.right.circle.fill")
                    .accessibilityHidden(true)
            }
        } .accentColor(.white)
    }
    
    @State private var showEditor: Bool = false
    @State private var note: Note = Note(id: UUID(), title: "Flawless Coastal Day", body: "Watching the view glow,\nThe beach seems to ebb and flow;\nSifting sands below", date: Date(), type: NoteType.haiku, favorites: true)
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<filteredNotes.count, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
//                            .shadow(radius: 5)
                            .frame(width: 500, height: 270)
                        
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text(filteredNotes[index].title)
                                    .font(.largeTitle)
                                    .fontWeight(.thin)
                                    .italic()
                                    .padding(.leading)
                                
                                Text(convertTypeToString(filteredNotes[index]))
                                    .font(.title.bold())
                                    .padding(.leading)
                            }
                            .padding()
                            
                            Spacer()
                            
                            HStack {
                                Button(action: {
                                    print("LOOOOOOOOOOOOOOOOOK: \(index)")
                                    selectItem(at: index)
                                }, label: {
                                    Text("View               >")
                                })
                                .buttonStyle(.bordered)
                                .cornerRadius(20)
                                .foregroundColor(.black)
                                .padding()
                                
                                Spacer()
                                
                                Text(convertDatetoString(filteredNotes[index]))
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .padding()
                            }
                            .padding()
                        }
                        .padding(30)
                        .frame(width: 500, height: 300)
                    }
                }
            }
            .onRotate { newOrientation in
                orientation = newOrientation
            }
            .tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
            
            VStack {
                Menu {
                    Button("Favorites") { filter = .favorites}
                    Button("Alphabetical") { filter = .alphabetical}
                    Menu("Type") {
                        Button("Other") { filter = .type; selectedType = "Other" }
                        Button("Speech") { filter = .type; selectedType = "Speech" }
                        Button("Song") { filter = .type; selectedType = "Song" }
                        Button("Play") { filter = .type; selectedType = "Play" }
                        Button("Spenserian Sonnet") { filter = .type; selectedType = "Spenserian Sonnet" }
                        Button("Shakespearean Sonnet") { filter = .type; selectedType = "Shakespearean Sonnet" }
                        Menu("Essays") {
                            Button("Informative Essay") { filter = .type; selectedType = "Informative Essay" }
                            Button("Narrative Essay") { filter = .type; selectedType = "Narrative Essay" }
                            Button("Expository Essay") { filter = .type; selectedType = "Expository Essay" }
                            Button("Argumentative Essay") { filter = .type; selectedType = "Argumentative Essay" }
                        }
                        Button("Haiku") { filter = .type; selectedType = "Haiku" }
                        Button("Poem") { filter = .type; selectedType = "Poem" }
                    }
                } label: {
                    Label("", systemImage: "ellipsis.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 30)
                }
            }
            .offset(x: 230, y: -180)
            
            controls
                .offset(y: 180)
        }
        .frame(width: 650, height: 400)
        .fullScreenCover(isPresented: $showEditor) {
            CMEditorView(note: note, tutorial: false)
        }
        .onAppear {
            index = filteredNotes.count
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        
        if filteredNotes.isEmpty {
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
//                        .shadow(radius: 5)
                        .frame(width: 500, height: 200)
                    
                    Text("No notes created of this type.")
                        .font(.title)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
            .onRotate { newOrientation in
                orientation = newOrientation
            }
            .padding()
        }
    }
    
    func selectItem(at index: Int) {
        note = allNotes.getFilteredInformation(index, from: filteredNotes)
        showEditor.toggle()
        dismiss()
    }
    
    func convertTypeToString(_ note: Note) -> String {
        if note.type == NoteType.poem {
            return "Poem"
        } else if note.type == NoteType.haiku {
            return "Haiku"
        } else if note.type == NoteType.argumentativeEssay {
            return "Argumentative Essay"
        } else if note.type == NoteType.expositoryEssay {
            return "Expository Essay"
        } else if note.type == NoteType.informativeEssay {
            return "Informative Essay"
        } else if note.type == NoteType.narrativeEssay {
            return "Narrative Essay"
        } else if note.type == NoteType.shakespeareanSonnet {
            return "Shakespearan Sonnet"
        } else if note.type == NoteType.spenserianSonnet {
            return "Spenserian Sonnet"
        } else if note.type == NoteType.play {
            return "Play"
        } else if note.type == NoteType.song {
            return "Song"
        } else if note.type == NoteType.speech {
            return "Speech"
        } else {
            return "Other"
        }
    }
    
    func convertDatetoString(_ note: Note) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: note.date)
    }
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : index - 1
        }
    }
    
    func next() {
        withAnimation {
            currentIndex = currentIndex < index ? currentIndex + 1 : 0
        }
    }
}

struct CMInfoBarView: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showWelcome: Bool = false
    @State private var showLearn: Bool = false
    @State private var showRandom: Bool = false
    @State private var showInfo: Bool = false
    
    var body: some View {
        ZStack {
            if #available(iOS 16.0, *) {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(100)
//                    .shadow(radius: 5)
                    .frame(width: 100, height: 1000)
                } else {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .cornerRadius(100)
//                    .shadow(radius: 5)
                    .frame(width: 100, height: 800)
            }
            
            VStack {
                Button() {
                    showWelcome.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .font(.system(size: 70))
                        .frame(width: 80, height: 80)
                        .foregroundColor(.mainBlue)
                        .colorScheme(.light)
                        .padding(.top)
                }
                
                Button() {
                    showLearn.toggle()
                } label: {
                    Image(systemName: "graduationcap.circle.fill")
                        .font(.system(size: 70))
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purpleLearn)
                        .colorScheme(.light)
                }
                
                Button() {
                    showRandom.toggle()
                } label: {
                    Image(systemName: "square.and.pencil.circle.fill")
                        .font(.system(size: 70))
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purpleRandom)
                        .colorScheme(.light)
                }
                
                Spacer()
                
                Button() {
                    showInfo.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 70))
                        .frame(width: 80, height: 80)
                        .foregroundColor(.mainPink)
                        .colorScheme(.light)
                        .padding()
                }
            }
        }
        .frame(width: 100, height: 800)
        .fullScreenCover(isPresented: $showWelcome, content: CMWelcomeView.init)
        .fullScreenCover(isPresented: $showLearn, content: CMLearnView.init)
        .fullScreenCover(isPresented: $showRandom, content: CMPromptView.init)
        .fullScreenCover(isPresented: $showInfo, content: CMAboutView.init)
        .onAppear(perform: dynamicLayout)
        .onRotate { newOrientation in
            orientation = newOrientation
            dynamicLayout()
        }
    }
    
    func dynamicLayout() {
        if horizontalSize == .regular && verticalSize == .regular && orientation.isLandscape {
           
        } else if horizontalSize == .regular && verticalSize == .regular && orientation.isPortrait {
            
        } else if horizontalSize == .compact && verticalSize == .regular {
            
        } else if horizontalSize == .compact && verticalSize == .compact {
            
        } else if horizontalSize == .regular && verticalSize == .compact {
            
        }
    }
}

struct CMHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CMHomeView()
    }
}

/*
 Adapt to All Devices of iPad and iOS!!
 Accessibility
 All Hit Areas Need to Work
 */

/*
 iPad - regular width, regular height for BOTH p/h
 iPhone - portrait have compact width and regular height.
 iPhone - landscape have compact width and compact height
 iPhone Pro/Maxes - landscape have regular width and compact height
 
 check if device is in which direction: (for iPad)
 @State private var orientation = UIDeviceOrientation.portrait

 at the end of view:
 .onRotate { newOrientation in
     orientation = newOrientation
 }
 */

/*
 func dynamicLayout() {
     if horizontalSize == .regular && verticalSize == .regular && orientation.isLandscape {
     } else if horizontalSize == .regular && verticalSize == .regular && orientation.isPortrait {
     } else if horizontalSize == .compact && verticalSize == .regular { //Portraint iPhone
     } else if horizontalSize == .compact && verticalSize == .compact { //landscape iPhone
     } else if horizontalSize == .regular && verticalSize == .compact { //landscape Pro Max
     }
 }
 */
