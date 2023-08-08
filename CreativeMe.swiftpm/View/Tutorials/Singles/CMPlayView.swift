//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Play Tutorial View
struct CMPlayView: View {
    var body: some View {
        CMPlayTutorialSlideOne()
    }
}

//MARK: Play Tutorial View One
struct CMPlayTutorialSlideOne: View {
    
    ///Variables for orientation, color scheme, dismisser, and step count
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showSecondSlide = false
    @State private var count: Int = 0
    
    ///Variables for accessibilityLabel and accessibilityHint regarding characters in a play
    @State private var accessibilityLabelOne: String = "Structure of the beginning of a play"
    @State private var accessibilityHintOne: String = "A play is mainly composed of three parts. The first part is a simple page with the title and authors centered in the middle. If the play is based off of another piece of work, you may state it here as well. The second is a page that involves the characters, setting, and time. This is considered separate from the main character dialogue and should be left aligned instead of centered. The narrator of the play may read this as an introduction piece. At the top of this page, the word 'Characters' should be in all capitalized letters and underlined. After, a list of characters should be shown in all capitalized letters as well. The first and last name should be printed with a comma after the age of the character. After this, a space should be given and the tense and time should be stated. An example is the present, dawn. Between these words is a comma to separate the tense and time. After another space, the word 'Place' should be capitalized fully and underlined. This is where a detailed description of the setting should be given. An example includes at Mistress Bella's relatively small apartment in Seattle, Washington in the central living room with a darkened door located to the right."
    
    ///Variables for accessibilityLabel and accessibilityHint regarding dialogue in a play
    @State private var accessibilityLabelTwo: String = "Structure of the body of a play"
    @State private var accessibilityHintTwo: String = "After the title and descriptions, the main part of a play is the character dialogue and directions. Before creating the dialogue, a bolded and underlined title should be created with the scene, act, and title of the section. An example is Scene 1-Act 1: Scarlett and Alexander's Casual Meeting. Next, all stage directions should be in parentheses. In addition, character names should be fully capitalized for all conditions except in the title. When a new character is speaking, this should be on another line separate from the dialogue. Together, the title, stage directions, character speaking changes, and the dialogue itself are on separate lines from each other with no additional spaces in between. All parts in this section are center aligned."
    
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
                    
                    Text("Learn to Write a Play")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image(colorScheme == .light ? "PlayCharactersExample" : "PlayCharactersExampleDark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.40)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.35)
                        .accessibilityLabel(accessibilityLabelOne)
                        .accessibilityHint(accessibilityHintOne)

                    CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 200, index: 0)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.16)

                    CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 200, index: 1)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.36)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Button {
                        showSecondSlide.toggle()
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
                            .colorScheme(.light)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.8, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Play")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image(colorScheme == .light ? "PlayCharactersExample" : "PlayCharactersExampleDark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.60)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.32, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                        .accessibilityLabel(accessibilityLabelOne)
                        .accessibilityHint(accessibilityHintOne)

                    CMPlayBodyView(initialWidth: 270, initialHeight: 120, finalWidth: 470, finalHeight: 200, index: 0)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.21, y: geo.frame(in: .local).minY + geo.size.height * 0.36)

                    CMPlayBodyView(initialWidth: 270, initialHeight: 120, finalWidth: 400, finalHeight: 250, index: 1)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.23, y: geo.frame(in: .local).minY + geo.size.height * 0.72)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Button {
                        showSecondSlide.toggle()
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
                            .colorScheme(.light)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.8, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Play")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        Image(colorScheme == .light ? "PlayCharactersExample" : "PlayCharactersExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                            .accessibilityLabel(accessibilityLabelOne)
                            .accessibilityHint(accessibilityHintOne)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .play, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .play, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .play, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                        
                    } else if count == 4 {
                        Image(colorScheme == .light ? "PlayDialogueExample" : "PlayDialogueExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.25)
                            .accessibilityLabel(accessibilityLabelTwo)
                            .accessibilityHint(accessibilityHintTwo)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 350, type: .play, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)
                        
                    } else if count == 5 {
                        Image(colorScheme == .light ? "PlayDialogueExample" : "PlayDialogueExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.25)
                            .accessibilityLabel(accessibilityLabelTwo)
                            .accessibilityHint(accessibilityHintTwo)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 350, type: .play, index: 4)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)
                        
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
                            .colorScheme(.light)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.13, y: geo.frame(in: .local).minY + geo.size.height * 0.10)
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Play")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        Image(colorScheme == .light ? "PlayCharactersExample" : "PlayCharactersExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                            .accessibilityLabel(accessibilityLabelOne)
                            .accessibilityHint(accessibilityHintOne)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.53)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 4 {
                        Image(colorScheme == .light ? "PlayDialogueExample" : "PlayDialogueExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                            .accessibilityLabel(accessibilityLabelTwo)
                            .accessibilityHint(accessibilityHintTwo)
                        
                    } else if count == 5 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 6 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 4)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
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
                            .colorScheme(.light)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.13, y: geo.frame(in: .local).minY + geo.size.height * 0.10)
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Play")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        Image(colorScheme == .light ? "PlayCharactersExample" : "PlayCharactersExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                            .accessibilityLabel(accessibilityLabelOne)
                            .accessibilityHint(accessibilityHintOne)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.53)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 4 {
                        Image(colorScheme == .light ? "PlayDialogueExample" : "PlayDialogueExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                            .accessibilityLabel(accessibilityLabelTwo)
                            .accessibilityHint(accessibilityHintTwo)
                        
                    } else if count == 5 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 6 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .play, index: 4)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
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
                            .colorScheme(.light)
                            .accessibilityLabel("Continue")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.13, y: geo.frame(in: .local).minY + geo.size.height * 0.10)
                }
            }
        }
        ///Presents next tutorial view based on button tap
        .fullScreenCover(isPresented: $showSecondSlide, content: CMPlayTutorialSlideTwo.init)
    }
}

//MARK: Play Tutorial View Two
struct CMPlayTutorialSlideTwo: View {
    
    ///Variables for orientation, color scheme, and dismissing
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    ///Variables for accessibilityLabel and accessibilityHint regarding dialogue in a play
    @State private var accessibilityLabelTwo: String = "Structure of the body of a play"
    @State private var accessibilityHintTwo: String = "After the title and descriptions, the main part of a play is the character dialogue and directions. Before creating the dialogue, a bolded and underlined title should be created with the scene, act, and title of the section. An example is Scene 1-Act 1: Scarlett and Alexander's Casual Meeting. Next, all stage directions should be in parentheses. In addition, character names should be fully capitalized for all conditions except in the title. When a new character is speaking, this should be on another line separate from the dialogue. Together, the title, stage directions, character speaking changes, and the dialogue itself are on separate lines from each other with no additional spaces in between. All parts in this section are center aligned."
    
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
                    
                    Text("Learn to Write a Play")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image(colorScheme == .light ? "PlayDialogueExample" : "PlayDialogueExampleDark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.25)
                        .accessibilityLabel(accessibilityLabelTwo)
                        .accessibilityHint(accessibilityHintTwo)

                    CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 680, finalHeight: 200, index: 2)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)

                    CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 680, finalHeight: 200, index: 3)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.66)

                    CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 680, finalHeight: 200, index: 4)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.85)
                    
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
                    
                    Text("Learn to Write a Play")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image(colorScheme == .light ? "PlayDialogueExample" : "PlayDialogueExampleDark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.28)
                        .accessibilityLabel(accessibilityLabelTwo)
                        .accessibilityHint(accessibilityHintTwo)

                    CMPlayBodyView(initialWidth: 570, initialHeight: 80, finalWidth: 870, finalHeight: 120, index: 2)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.51)

                    CMPlayBodyView(initialWidth: 570, initialHeight: 80, finalWidth: 870, finalHeight: 120, index: 3)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.68)

                    CMPlayBodyView(initialWidth: 570, initialHeight: 80, finalWidth: 870, finalHeight: 120, index: 4)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.85)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            }
        }
    }
}

//MARK: Play Tutorial Card View
struct CMPlayBodyView: View {
    
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
                CMPlayBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMPlayFront(width: self.$width, height: self.$height)
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

//MARK: Play Tutorial Front View
struct CMPlayFront: View {
    
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

//MARK: Play Tutorial Back View
struct CMPlayBack: View {
    
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
            return "Tip #1:"
        } else if index == 1 {
            return "Tip #2:"
        } else if index == 2 {
            return "Step #1:"
        } else if index == 3 {
            return "Step #2:"
        } else if index == 4 {
            return "Step #3:"
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
                    Text("\(title)\n\n\(Information.shared.playInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.playInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.playInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.playInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.playInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        }
    }
}

//MARK: Play Tutorial View Preview
struct CMPlayView_Previews: PreviewProvider {
    static var previews: some View {
        CMPlayView()
            .environmentObject(OrientationInfo())
    }
}
