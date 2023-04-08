//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Home View
struct CMHomeView: View {
    
    ///Variables for orientation, color scheme, and intializes user data
    @EnvironmentObject var orientationInfo: OrientationInfo
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
                        
                    ///Optimized for any iPad in Portrait
                    if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                        Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                            .padding()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        CMNoteView()
                            .contentShape(Capsule())
                            .position(x: geo.frame(in: .local).midX * 0.78, y: geo.frame(in: .local).midY + geo.size.height * 0.3)
                        
                        CMInfoBarView()
                            .position(x: geo.frame(in: .local).midX * 1.7, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                        
                        CMAddNote()
                            .position(x: geo.frame(in: .local).midX * 0.78, y: geo.frame(in: .local).minY + geo.size.height * 0.40)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.45, height: 1)
                            .foregroundColor(.white)
                            .position(x: geo.frame(in: .local).midX * 0.77, y: geo.frame(in: .local).minY + geo.size.height * 0.64)
                        
                    ///Optimized for any iPad in Landscape
                    } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                        Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                            .padding()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        CMNoteView()
                            .contentShape(Capsule())
                            .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.75)
                        
                        CMInfoBarView()
                            .position(x: geo.frame(in: .local).midX * 1.55, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                        
                        CMAddNote()
                            .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.37)
                        
                    ///Optimized for any iPhone in Portrait
                    } else if horizontalSize == .compact && verticalSize == .regular {
                        Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 100)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.08)
                        
                        CMNoteView()
                            .contentShape(Capsule())
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.78)
                        
                        CMInfoBarView()
                            .position(x: geo.frame(in: .local).midX * 1.5, y: geo.frame(in: .local).minY + geo.size.height * 0.42)
                        
                        CMAddNote()
                            .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.40)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.45, height: 1)
                            .foregroundColor(.white)
                            .position(x: geo.frame(in: .local).midX * 0.77, y: geo.frame(in: .local).minY + geo.size.height * 0.64)
                        
                    ///Optimized for any iPhone in Landscape
                    } else if horizontalSize == .compact && verticalSize == .compact {
                        Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 100)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.15)
                        
                        CMNoteView()
                            .contentShape(Capsule())
                            .position(x: geo.frame(in: .local).maxX * 0.77, y: geo.frame(in: .local).midY + geo.size.height * 0.10)
                        
                        CMInfoBarView()
                            .position(x: geo.frame(in: .local).midX * 0.55, y: geo.frame(in: .local).midY + geo.size.height * 0.35)
                        
                        CMAddNote()
                            .position(x: geo.frame(in: .local).midX * 0.55, y: geo.frame(in: .local).minY + geo.size.height * 0.46)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.35, height: 1)
                            .foregroundColor(.white)
                            .position(x: geo.frame(in: .local).midX * 0.55, y: geo.frame(in: .local).minY + geo.size.height * 0.7)
                       
                    ///Optimized for any iPhone Pro/Plus Landscape
                    } else if horizontalSize == .regular && verticalSize == .compact {
                        Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 100)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.15)
                        
                        CMNoteView()
                            .contentShape(Capsule())
                            .position(x: geo.frame(in: .local).maxX * 0.77, y: geo.frame(in: .local).midY + geo.size.height * 0.10)
                        
                        CMInfoBarView()
                            .position(x: geo.frame(in: .local).midX * 0.55, y: geo.frame(in: .local).midY + geo.size.height * 0.35)
                        
                        CMAddNote()
                            .position(x: geo.frame(in: .local).midX * 0.55, y: geo.frame(in: .local).minY + geo.size.height * 0.46)
                        
                        Rectangle()
                            .frame(width: geo.size.width * 0.35, height: 1)
                            .foregroundColor(.white)
                            .position(x: geo.frame(in: .local).midX * 0.55, y: geo.frame(in: .local).minY + geo.size.height * 0.7)
                    }
                }
            }
            .environmentObject(OrientationInfo())
        }
        .environmentObject(allNotes)
    }
}

//MARK: Add New Note View
struct CMAddNote: View {
    
    ///Variables for orientation, color scheme, and showing CMEditorView
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @State private var showCreatorView: Bool = false
    
    var body: some View {
        ZStack {
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .frame(width: 500, height: 450)
                
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
                
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .frame(width: 550, height: 250)
                
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
                .frame(width: 550, height: 250)
                .contentShape(Rectangle())
                .onTapGesture {
                    showCreatorView.toggle()
                }
                
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .frame(width: 175, height: 300)
                
                Button() {
                    showCreatorView.toggle()
                } label: {
                    VStack {
                        Text("+")
                            .foregroundColor(.primary)
                            .font(.system(size: 70))
                            .fontWeight(.thin)
                        Text("New Note")
                            .foregroundColor(.primary)
                            .font(.system(size: 30))
                            .fontWeight(.thin)
                    }
                }
                .frame(width: 175, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    showCreatorView.toggle()
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .frame(width: 300, height: 130)
                
                Button() {
                    showCreatorView.toggle()
                } label: {
                    VStack {
                        Text("+")
                            .foregroundColor(.primary)
                            .font(.system(size: 60))
                            .fontWeight(.thin)
                        Text("New Note")
                            .foregroundColor(.primary)
                            .font(.system(size: 27))
                            .fontWeight(.thin)
                    }
                }
                .frame(width: 300, height: 130)
                .contentShape(Rectangle())
                .onTapGesture {
                    showCreatorView.toggle()
                }
                
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .frame(width: 300, height: 130)
                
                Button() {
                    showCreatorView.toggle()
                } label: {
                    VStack {
                        Text("+")
                            .foregroundColor(.primary)
                            .font(.system(size: 60))
                            .fontWeight(.thin)
                        Text("New Note")
                            .foregroundColor(.primary)
                            .font(.system(size: 27))
                            .fontWeight(.thin)
                    }
                }
                .frame(width: 300, height: 130)
                .contentShape(Rectangle())
                .onTapGesture {
                    showCreatorView.toggle()
                }
                
            }
        }
        ///Reveals CMCreatorView: Allows user to create new note
        .fullScreenCover(isPresented: $showCreatorView, content: CMCreatorView.init)
    }
}

//MARK: All Notes Slider
struct CMNoteView: View {
    
    ///Variables for orientation, color scheme, exit screen, and reads user data
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var allNotes: Notes
    
    ///Variables for user's selection type of note and filter types
    @State private var selectedType: String = "Poem"
    @State private var filter: FilterType = .alphabetical
    let pickFilter = ["Type", "Alphabetical"]
    
    ///Enumeration for filtering types available
    enum FilterType {
        case type, alphabetical, favorites
    }
    
    ///Get-only variable for filtering data
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
    
    ///Get-only variable for converting selection type
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
    
    ///Variables for index selection and converter
    @State private var currentIndex = 0
    @State private var index = 0
    
    ///Controller view for parsing between each note on the slider
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
    
    ///Variables to present CMEditorView with note choosen
    @State private var showEditor: Bool = false
    @State private var note: Note = Note(id: UUID(), title: "Flawless Coastal Day", body: "Watching the view glow,\nThe beach seems to ebb and flow;\nSifting sands below", date: Date(), type: NoteType.haiku, favorites: true)
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<filteredNotes.count, id: \.self) { index in
                        
                    ///Optimized for any iPad in Portrait
                    if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                        ZStack {
                            Rectangle()
                                .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                                .cornerRadius(20)
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
                            .frame(width: 500, height: 270)
                        }
                        
                    ///Optimized for any iPad in Landscape
                    } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                        ZStack {
                            Rectangle()
                                .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                                .cornerRadius(20)
                                .frame(width: 550, height: 250)
                            
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
                            .frame(width: 550, height: 250)
                        }
                        
                    ///Optimized for any iPhone in Portrait
                    } else if horizontalSize == .compact && verticalSize == .regular { 
                        ZStack {
                            Rectangle()
                                .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                                .cornerRadius(20)
                                .frame(width: 270, height: 150)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text(filteredNotes[index].title)
                                        .font(.title3)
                                        .fontWeight(.thin)
                                        .italic()
                                        .padding(.leading)
                                    
                                    Text(convertTypeToString(filteredNotes[index]))
                                        .font(.headline.bold())
                                        .padding(.leading)
                                }
                                .padding()
                                
                                Spacer()
                                
                                HStack {
                                    Button(action: {
                                        selectItem(at: index)
                                    }, label: {
                                        Text("View   >")
                                    })
                                    .buttonStyle(.bordered)
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                    .padding()
                                    
                                    Spacer()
                                    
                                    Text(convertDatetoString(filteredNotes[index]))
                                        .font(.title3)
                                        .fontWeight(.thin)
                                        .padding()
                                }
                                .padding(5)
                            }
                            .padding(5)
                            .frame(width: 270, height: 150)
                        }
                        
                    ///Optimized for any iPhone in Landscape
                    } else if horizontalSize == .compact && verticalSize == .compact {
                        ZStack {
                            Rectangle()
                                .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                                .cornerRadius(20)
                                .frame(width: 310, height: 170)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text(filteredNotes[index].title)
                                        .font(.title2)
                                        .fontWeight(.thin)
                                        .italic()
                                        .padding(.leading)
                                    
                                    Text(convertTypeToString(filteredNotes[index]))
                                        .font(.headline.bold())
                                        .padding(.leading)
                                }
                                .padding()
                                
                                Spacer()
                                
                                HStack {
                                    Button(action: {
                                        selectItem(at: index)
                                    }, label: {
                                        Text("View   >")
                                    })
                                    .buttonStyle(.bordered)
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                    .padding()
                                    
                                    Spacer()
                                    
                                    Text(convertDatetoString(filteredNotes[index]))
                                        .font(.title3)
                                        .fontWeight(.thin)
                                        .padding()
                                }
                                .padding(5)
                            }
                            .padding(5)
                            .frame(width: 310, height: 170)
                        }
                        
                    ///Optimized for any iPhone Pro/Plus Landscape
                    } else if horizontalSize == .regular && verticalSize == .compact {
                        ZStack {
                            Rectangle()
                                .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                                .cornerRadius(20)
                                .frame(width: 310, height: 170)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text(filteredNotes[index].title)
                                        .font(.title2)
                                        .fontWeight(.thin)
                                        .italic()
                                        .padding(.leading)
                                    
                                    Text(convertTypeToString(filteredNotes[index]))
                                        .font(.headline.bold())
                                        .padding(.leading)
                                }
                                .padding()
                                
                                Spacer()
                                
                                HStack {
                                    Button(action: {
                                        selectItem(at: index)
                                    }, label: {
                                        Text("View   >")
                                    })
                                    .buttonStyle(.bordered)
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                    .padding()
                                    
                                    Spacer()
                                    
                                    Text(convertDatetoString(filteredNotes[index]))
                                        .font(.title3)
                                        .fontWeight(.thin)
                                        .padding()
                                }
                                .padding(5)
                            }
                            .padding(5)
                            .frame(width: 310, height: 170)
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
                
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
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
                
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
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
                .offset(x: 310, y: -110)
                
                controls
                    .offset(y: 175)
                
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
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
                .offset(x: 120, y: 110)
                
                controls
                    .offset(y: 110)
                
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
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
                .offset(x: 130, y: -130)
                
                controls
                    .offset(y: 110)
               
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
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
                .offset(x: 130, y: -130)
                
                controls
                    .offset(y: 110)
            }
        }
        .frame(width: 650, height: 400)
        ///Presents CMEditorView based on user selection
        .fullScreenCover(isPresented: $showEditor) {
            CMEditorView(note: note, tutorial: false)
        }
        .onAppear {
            index = filteredNotes.count
        }
        
        if filteredNotes.isEmpty {
                
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .frame(width: 500, height: 200)
                    
                    Text("No notes created of this type.")
                        .font(.title)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
                .padding()
              
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .frame(width: 500, height: 100)
                    
                    Text("No notes created of this type.")
                        .font(.title)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
                .padding()
                
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .frame(width: 270, height: 100)
                    
                    Text("No notes created of this type.")
                        .font(.title3)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
                .padding()
                
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .frame(width: 310, height: 50)
                    
                    Text("No notes created of this type.")
                        .font(.title3)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
                .padding()
                
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                ZStack {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .frame(width: 310, height: 50)
                    
                    Text("No notes created of this type.")
                        .font(.title3)
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
                .padding()
            }
        }
    }
    
    ///Gets information of a given note in the filtered list
    func selectItem(at index: Int) {
        note = allNotes.getFilteredInformation(index, from: filteredNotes)
        showEditor.toggle()
        dismiss()
    }
    
    ///Converts between note type to String for ease of presentation
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
    
    ///Converts between Date to formated String for presentation
    func convertDatetoString(_ note: Note) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: note.date)
    }
    
    ///Parsing to previous selection based on button tap
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : index - 1
        }
    }
    
    ///Parsing to next selection based on button tap
    func next() {
        withAnimation {
            currentIndex = currentIndex < index ? currentIndex + 1 : 0
        }
    }
}

//MARK: Bar View with Main Buttons
struct CMInfoBarView: View {
    
    ///Variables for orientation and color scheme
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    ///Variables for presenting CMWelcomeView, CMLearnView, CMPromptView, and CMAboutView
    @State private var showWelcome: Bool = false
    @State private var showLearn: Bool = false
    @State private var showPrompt: Bool = false
    @State private var showAbout: Bool = false
    
    var body: some View {
            
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            ZStack {
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(100)
                        .frame(width: 100, height: 940)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
                        .frame(width: 100, height: 940)
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
                        showPrompt.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .font(.system(size: 70))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.purpleRandom)
                            .colorScheme(.light)
                    }
                    
                    Spacer()
                    
                    Button() {
                        showAbout.toggle()
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
            
            ///Presents each view based on boolean value
            .fullScreenCover(isPresented: $showWelcome, content: CMWelcomeView.init)
            .fullScreenCover(isPresented: $showLearn, content: CMLearnView.init)
            .fullScreenCover(isPresented: $showPrompt, content: CMPromptView.init)
            .fullScreenCover(isPresented: $showAbout, content: CMAboutView.init)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            ZStack {
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(100)
                        .frame(width: 150, height: 600)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
                        .frame(width: 150, height: 600)
                }
                
                VStack {
                    Button() {
                        showWelcome.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .font(.system(size: 85))
                            .frame(width: 85, height: 85)
                            .foregroundColor(.mainBlue)
                            .colorScheme(.light)
                            .padding(.top)
                            .padding(5)
                    }
                    
                    Button() {
                        showLearn.toggle()
                    } label: {
                        Image(systemName: "graduationcap.circle.fill")
                            .font(.system(size: 85))
                            .frame(width: 85, height: 85)
                            .foregroundColor(.purpleLearn)
                            .colorScheme(.light)
                            .padding(5)
                    }
                    
                    Button() {
                        showPrompt.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .font(.system(size: 85))
                            .frame(width: 85, height: 85)
                            .foregroundColor(.purpleRandom)
                            .colorScheme(.light)
                            .padding(5)
                    }
                    
                    Spacer()
                    
                    Button() {
                        showAbout.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 85))
                            .frame(width: 80, height: 80)
                            .foregroundColor(.mainPink)
                            .colorScheme(.light)
                            .padding(30)
                    }
                }
            }
            .frame(width: 100, height: 600)
            
            ///Presents each view based on boolean value
            .fullScreenCover(isPresented: $showWelcome, content: CMWelcomeView.init)
            .fullScreenCover(isPresented: $showLearn, content: CMLearnView.init)
            .fullScreenCover(isPresented: $showPrompt, content: CMPromptView.init)
            .fullScreenCover(isPresented: $showAbout, content: CMAboutView.init)
            
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            ZStack {
                VStack {
                    Button() {
                        showWelcome.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "line.3.horizontal.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainBlue)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showLearn.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "graduationcap.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showPrompt.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showAbout.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                }
            }
            .frame(width: 100, height: 270)
            
            ///Presents each view based on boolean value
            .fullScreenCover(isPresented: $showWelcome, content: CMWelcomeView.init)
            .fullScreenCover(isPresented: $showLearn, content: CMLearnView.init)
            .fullScreenCover(isPresented: $showPrompt, content: CMPromptView.init)
            .fullScreenCover(isPresented: $showAbout, content: CMAboutView.init)
            
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            ZStack {
                HStack {
                    Button() {
                        showWelcome.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "line.3.horizontal.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainBlue)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showLearn.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "graduationcap.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showPrompt.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showAbout.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                }
            }
            .frame(width: 240, height: 100)
            
            ///Presents each view based on boolean value
            .fullScreenCover(isPresented: $showWelcome, content: CMWelcomeView.init)
            .fullScreenCover(isPresented: $showLearn, content: CMLearnView.init)
            .fullScreenCover(isPresented: $showPrompt, content: CMPromptView.init)
            .fullScreenCover(isPresented: $showAbout, content: CMAboutView.init)
            
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            ZStack {
                HStack {
                    Button() {
                        showWelcome.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "line.3.horizontal.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainBlue)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showLearn.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "graduationcap.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showPrompt.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                    
                    Button() {
                        showAbout.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 60))
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding(8)
                        }
                    }
                }
            }
            .frame(width: 240, height: 100)
            
            ///Presents each view based on boolean value
            .fullScreenCover(isPresented: $showWelcome, content: CMWelcomeView.init)
            .fullScreenCover(isPresented: $showLearn, content: CMLearnView.init)
            .fullScreenCover(isPresented: $showPrompt, content: CMPromptView.init)
            .fullScreenCover(isPresented: $showAbout, content: CMAboutView.init)
        }
    }
}

//MARK: Home View Preview
struct CMHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CMHomeView()
            .environmentObject(OrientationInfo())
    }
}
