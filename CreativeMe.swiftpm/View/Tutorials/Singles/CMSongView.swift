//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Song Tutorial View
struct CMSongView: View {
    
    ///Variables for orientation, color scheme, dismisser, and step count
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var count: Int = 0
    
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
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Song")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMSongStructureView()
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.32, y: geo.frame(in: .local).minY + geo.size.height * 0.34)
                    
                    CMSongBodyView(initialWidth: 410, initialHeight: 200, finalWidth: 410, finalHeight: 370, index: 0)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.26)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.63, y: geo.frame(in: .local).minY + geo.size.height * 0.37)

                    CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 660, finalHeight: 210, index: 1)
                        .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.65)

                    CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 660, finalHeight: 210, index: 2)
                        .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.86)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Song")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMSongStructureView()
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.24, y: geo.frame(in: .local).midY - geo.size.height * 0.03)
                    
                    CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 150, index: 0)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.26)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.56, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                    CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 150, index: 1)
                        .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.56, y: geo.frame(in: .local).minY + geo.size.height * 0.58)

                    CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 150, index: 2)
                        .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
                        .position(x: geo.frame(in: .local).minX  + geo.size.width * 0.56, y: geo.frame(in: .local).minY + geo.size.height * 0.81)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Song")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.05, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                    
                    if count == 0 {
                        CMSongStructureView()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: .song, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: .song, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: .song, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else {
                        Text("You're good to go!")
                            .font(.title)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                    }
                    
                    Button {
                        count += 1
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title2)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.15, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Song")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMSongStructureView()
                            .scaleEffect(0.55)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .song, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .song, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .song, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else {
                        Text("You're good to go!")
                            .font(.title)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                    }
                    
                    Button {
                        count += 1
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.89, y: geo.frame(in: .local).minY + geo.size.height * 0.86)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title2)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.11, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Song")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMSongStructureView()
                            .scaleEffect(0.55)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .song, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .song, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .song, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else {
                        Text("You're good to go!")
                            .font(.title)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                    }
                    
                    Button {
                        count += 1
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.89, y: geo.frame(in: .local).minY + geo.size.height * 0.86)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title2)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.11, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                }
            }
        }
    }
}

//MARK: Song Structure View
struct CMSongStructureView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for accessibilityLabel and accessibilityHint
    @State private var accessibilityLabel: String = "Structure of a song"
    @State private var accessibilityHint: String = "The structure of a song takes many forms. The most common form and simple form is one that consists of the following: verse 1, chorus, verse 2, chorus, bridge, verse 3, and chorus. Follow the cards below to learn more about what is verse, chorus, and bridge is."
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            VStack(alignment: .leading) {
                Text("General Structure")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Verse 1")
                    .foregroundColor(.mainPink)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Verse 2")
                    .foregroundColor(.purpleRandom)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Bridge")
                    .font(.title)
                    .underline()
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Verse 3")
                    .foregroundColor(.mainBlue)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            VStack(alignment: .leading) {
                Text("General Structure")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Verse 1")
                    .foregroundColor(.mainPink)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Verse 2")
                    .foregroundColor(.purpleRandom)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Bridge")
                    .font(.title)
                    .underline()
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Verse 3")
                    .foregroundColor(.mainBlue)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            VStack(alignment: .leading) {
                Text("General Structure")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Verse 1")
                    .foregroundColor(.mainPink)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Verse 2")
                    .foregroundColor(.purpleRandom)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Bridge")
                    .font(.title)
                    .underline()
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Verse 3")
                    .foregroundColor(.mainBlue)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            VStack(alignment: .leading) {
                Text("General Structure")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Verse 1")
                    .foregroundColor(.mainPink)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Verse 2")
                    .foregroundColor(.purpleRandom)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Bridge")
                    .font(.title)
                    .underline()
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Verse 3")
                    .foregroundColor(.mainBlue)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            VStack(alignment: .leading) {
                Text("General Structure")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Verse 1")
                    .foregroundColor(.mainPink)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Verse 2")
                    .foregroundColor(.purpleRandom)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Bridge")
                    .font(.title)
                    .underline()
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("Verse 3")
                    .foregroundColor(.mainBlue)
                    .font(.title.italic())
                    .fontWeight(.medium)
                    .padding(.bottom)
                    .colorScheme(.light)
                
                Text("Chorus")
                    .foregroundColor(.darkPurple)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        }
    }
}

//MARK: Song Tutorial Card View
struct CMSongBodyView: View {
    
    ///Variables for front/back side, degress in change, and width/height
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    ///Variables for setting each width and height for different states
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
    ///Variable for index of information
    let index: Int
    
    var body: some View {
        ZStack {
            if flipped {
                CMSongBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMSongFront(width: self.$width, height: self.$height)
            }
        }
        .background(Color.gray)
        .cornerRadius(20)
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            if self.flipped {
                self.flipped = false
                withAnimation {
                    self.degrees += 180
                    self.width = initialWidth
                    self.height = initialHeight
                }
            } else {
                self.flipped = true
                withAnimation {
                    self.degrees -= 180
                    self.width = finalWidth
                    self.height = finalHeight
                }
            }
        }
        ///Sets dimensions specified on each run
        .onAppear(perform: setDimensions)
    }
    
    ///Assigns values to each local variable
    func setDimensions() {
        width = initialWidth
        height = initialHeight
    }
}

//MARK: Song Tutorial Front View
struct CMSongFront: View {
    
    ///Variables for getting width/height specified
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.mainPink)
            .frame(width: self.width, height: self.height)
            .overlay(
                Image(systemName: "doc.plaintext")
                    .font(.largeTitle)
                    .accessibilityLabel("Tap to flip")
            )
            .foregroundColor(.white)
    }
}

//MARK: Song Tutorial Back View
struct CMSongBack: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for getting width/height specified
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    ///Variable for index of information
    let index: Int
    
    ///Get-only variable for setting prefix title based on index
    var title: String {
        if index == 0 {
            return "What is a verse?"
        } else if index == 1 {
            return "What is a chorus?"
        } else if index == 2 {
            return "What is a bridge?"
        } else {
            return ""
        }
    }
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(Information.shared.songInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(Information.shared.songInstructions[index])")
                        .padding(20)
                        .font(.title3)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(Information.shared.songInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(Information.shared.songInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(Information.shared.songInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        }
    }
}

//MARK: Song Tutorial View Preview
struct CMSongView_Previews: PreviewProvider {
    static var previews: some View {
        CMSongView()
            .environmentObject(OrientationInfo())
    }
}
