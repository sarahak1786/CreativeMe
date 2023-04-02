//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/1/23.
//

/*
 Adapt to All Devices of iPad and iOS
 Accessibility
 All Hit Areas Need to Work
 */

import SwiftUI

struct CMHomeView: View {
    
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
                        .shadow(radius: 20)
                    
                    CMInfoBarView()
                        .position(x: geo.frame(in: .local).midX * 1.6, y: geo.frame(in: .local).minY + geo.size.height * 0.58)
                    CMAddNote()
                        .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.40)
                    
                    Rectangle()
                        .frame(width: geo.size.width * 0.50, height: 1)
                        .foregroundColor(.white)
                        .position(x: geo.frame(in: .local).midX * 0.77, y: geo.frame(in: .local).minY + geo.size.height * 0.63)
                    
                    CMNoteView()
                        .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.80)
                }
            }
        }
        .environmentObject(allNotes)
    }
}

struct CMAddNote: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.35)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Button() {
                    //Add Action
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
                .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.35)
                .contentShape(Rectangle())
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                .onTapGesture {
                    //
                }
            }
        }
    }
}

struct CMNoteView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var allNotes: Notes
    
    @State private var selectedType = "Poem"
    let pickFilter = ["Type", "Alphabetical"]
    @State private var filter: FilterType = .alphabetical
    
    enum FilterType {
        case type, alphabetical
    }
    
    var filteredNotes: [Note] {
        switch filter {
        case .type:
            return allNotes.notes.filter {typesFiltered == $0.type ? true : false}
        case .alphabetical:
            return allNotes.notes.sorted {
                $0.title < $1.title
            }
        }
    }
    
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
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<filteredNotes.count, id: \.self) { index in
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .shadow(radius: 20)
                            .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.20)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
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
                                NavigationLink("View               >") {
                                    
                                }
                                .cornerRadius(20)
                                .foregroundColor(.black)
                                .buttonStyle(.bordered)
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
                        .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
            
            GeometryReader { geo in
                Menu {
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
                }
                .position(x: geo.frame(in: .local).midX * 1.4, y: geo.frame(in: .local).midY * 0.73)
                
                controls
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY * 1.25)
            }
        }
        .onAppear {
            index = filteredNotes.count
        }
        
        if filteredNotes.isEmpty {
            GeometryReader { geo in
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("No notes created of this type.")
                        .font(.title)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                        .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.20)
                }
            }
            .padding()
        }
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
    
    @Environment(\.colorScheme) var colorScheme
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.13, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.47)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.10, height: geo.size.height * 0.85)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.50)
                }
                
                ZStack {
                    Button() {
                        //Add Action
                    } label: {
                        Image("Hamburger Bar")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.14)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Learn")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.21)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Random")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.28)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Information")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.80)
                }
            }
        }
    }
}

struct CMHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CMHomeView()
    }
}
