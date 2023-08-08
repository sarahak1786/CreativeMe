//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Sonnet Tutorial View
struct CMSonnetView: View {
    
    ///Variables for orientation, color scheme, selected sonnet type, and step count
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    let sonnetType: NoteType
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
                    
                    CMSonnetTitleView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMSonnetStructureView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).minX + geo.size.height * 0.20, y: geo.frame(in: .local).midY)
                    
                    CMSonnetImageView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.22)
                    
                    CMSonnetBodyView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, sonnetType: sonnetType, index: 0)
                        .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.35)
                        .position(x: geo.frame(in: .local).midX + geo.size.height * 0.1, y: geo.frame(in: .local).minY + geo.size.height * 0.5)
                    
                    CMSonnetBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 600, finalHeight: 200, sonnetType: sonnetType, index: 1)
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.15)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.30)

                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.14, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMSonnetTitleView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMSonnetStructureView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).minX + geo.size.height * 0.35, y: geo.frame(in: .local).midY + geo.size.height * 0.06)
                    
                    CMSonnetImageView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).midX + geo.size.height * 0.14, y: geo.frame(in: .local).minY + geo.size.height * 0.25)
                    
                    CMSonnetBodyView(initialWidth: 400, initialHeight: 100, finalWidth: 600, finalHeight: 180, sonnetType: sonnetType, index: 0)
                        .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.35)
                        .position(x: geo.frame(in: .local).midX + geo.size.height * 0.17, y: geo.frame(in: .local).minY + geo.size.height * 0.5)
                    
                    CMSonnetBodyView(initialWidth: 400, initialHeight: 100, finalWidth: 600, finalHeight: 150, sonnetType: sonnetType, index: 1)
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX + geo.size.height * 0.17, y: geo.frame(in: .local).midY + geo.size.height * 0.24)

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
                    
                    CMSonnetTitleView(sonnetType: sonnetType)
                        .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.15)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.03, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                    
                    if count == 0 {
                        CMSonnetStructureView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX - geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 1 {
                        CMSonnetImageView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.26)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: sonnetType, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                        
                    } else if count == 2 {
                        CMSonnetImageView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.26)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: sonnetType, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                        
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
                    
                    CMSonnetTitleView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMSonnetStructureView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX - geo.size.width * 0.42, y: geo.frame(in: .local).minY + geo.size.height * 0.62)
                            .scaleEffect(0.55)
                        
                        CMSonnetImageView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX + geo.size.width * 0.1, y: geo.frame(in: .local).midY)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 300, initialHeight: 120, finalWidth: 500, finalHeight: 250, type: sonnetType, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 300, initialHeight: 120, finalWidth: 500, finalHeight: 250, type: sonnetType, index: 1)
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
                    
                    CMSonnetTitleView(sonnetType: sonnetType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMSonnetStructureView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX - geo.size.width * 0.42, y: geo.frame(in: .local).minY + geo.size.height * 0.62)
                            .scaleEffect(0.55)
                        
                        CMSonnetImageView(sonnetType: sonnetType)
                            .position(x: geo.frame(in: .local).midX + geo.size.width * 0.1, y: geo.frame(in: .local).midY)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 300, initialHeight: 120, finalWidth: 500, finalHeight: 250, type: sonnetType, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 300, initialHeight: 120, finalWidth: 500, finalHeight: 250, type: sonnetType, index: 1)
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

//MARK: Sonnet Title View
struct CMSonnetTitleView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variable for selected sonnet type
    let sonnetType: NoteType
    
    ///Get-only variable converting between NoteType to String title
    var title: String {
        if sonnetType == .shakespeareanSonnet {
            return "Learn to Write a Shakespearan Sonnet"
        } else if sonnetType == .spenserianSonnet {
            return "Learn to Write an Spenserian Sonnet"
        } else {
            return "Unknown Type: Try Again."
        }
    }
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            Text("\(title)")
                .font(.largeTitle)
                .fontWeight(.thin)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            Text("\(title)")
                .font(.largeTitle)
                .fontWeight(.thin)
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            Text("\(title)")
                .font(.title2)
                .fontWeight(.thin)
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            Text("\(title)")
                .font(.title)
                .fontWeight(.thin)
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            Text("\(title)")
                .font(.title)
                .fontWeight(.thin)
        
        }
    }
}

//MARK: Sonnet Image View
struct CMSonnetImageView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    ///Variable for selected sonnet type
    let sonnetType: NoteType
    
    ///Get-only variable for image name based on type and colorScheme
    var title: String {
        if (sonnetType == .shakespeareanSonnet) && colorScheme == .light {
            return "IambicShakespeareExample"
        } else if (sonnetType == .shakespeareanSonnet) && colorScheme == .dark {
            return "IambicShakespeareExampleDark"
        } else if (sonnetType == .spenserianSonnet) && colorScheme == .light {
            return "IambicSpenserianExample"
        } else if (sonnetType == .spenserianSonnet) && colorScheme == .dark  {
            return "IambicSpenserianExampleDark"
        } else {
            return "NA"
        }
    }
    
    ///Variable for accessibilityLabel
    var accessibilityLabel: String = "Structure of iambic pentameter"
    
    ///Get-only variable for accessibilityHint
    var accessibilityHint: String {
        if (sonnetType == .shakespeareanSonnet) {
            return "Iambic pentameter is a form of meter in poetry that consists of five sections each with one unstressed syllable followed by a stressed syllable. A stressed syllable is typically emphasized and more pronounced such as the word out. An unstressed syllable is less emphasized such as the word of. When writing a Shakespearan sonnet, iambic pentameter is used for each line. Here is an example of a famous line by Shakespeare: Shall I compare thee to a summer's day?"
        } else if (sonnetType == .spenserianSonnet) {
            return "Iambic pentameter is a form of meter in poetry that consists of five sections each with one unstressed syllable followed by a stressed syllable. A stressed syllable is typically emphasized and more pronounced such as the word out. An unstressed syllable is less emphasized such as the word of. Iambic pentameter can be used in a Spenserian sonnet, but it is only a recommendation. Here is an example of a line by Spenser: One day I wrote her name upon the strand."
        } else {
            return "NA"
        }
    }
    
    var body: some View {
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            Image(title)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            Image(title)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            Image(title)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            Image(title)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            Image(title)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
        }
    }
}

//MARK: Sonnet Structure View
struct CMSonnetStructureView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variable for selected sonnet type
    let sonnetType: NoteType
    
    ///Get-only variable for accessibilityLabel
    var accessibilityLabel: String {
        if (sonnetType == .shakespeareanSonnet) {
            return "Structure of a Shakespearan Sonnet"
        } else if (sonnetType == .spenserianSonnet) {
            return "Structure of a Spenserian Sonnet"
        } else {
            return "NA"
        }
    }
    
    ///Get-only variable for accessibilityHint
    var accessibilityHint: String {
        if (sonnetType == .shakespeareanSonnet) {
            return "Each sonnet has a rhyme structure that marks them unique from others. A Shakespearan sonnet is characteristic of having an A, B, A, B, C, D, C, D, E, F, E, F, and G, G rhyme pattern. This means that at the end of each line, a certain word will rhyme with another and this is denoted by letters such as A and A. Together, there are 14 lines in this poem and each stanza is a group of 4 lines with a single pair at the end."
        } else if (sonnetType == .spenserianSonnet) {
            return "Each sonnet has a rhyme structure that marks them unique from others. A Spenserian sonnet is characteristic of having an A, B, A, B, B, C, B, C, C, D, C, D, and E, E rhyme pattern. This means that at the end of each line, a certain word will rhyme with another and this is denoted by letters such as A and A. Together, there are 14 lines in this poem and each stanza is a group of 4 lines with a single pair at the end."
        } else {
            return "NA"
        }
    }
    
    var body: some View {
        if sonnetType == .shakespeareanSonnet {
            HStack {
                VStack {
                    Text("Stanza 1")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 2")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 3")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 50)
                    
                    Text("S4")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                }
                .font(.title)
                .padding(.trailing, 5)
                .foregroundColor(.mainPink)
                .padding(.trailing, -30)
                
                VStack(alignment: .leading) {
                    Group {
                        Group {
                            Text("Line 1")
                            Text("Line 2")
                            Text("Line 3")
                            Text("Line 4").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 5")
                            Text("Line 6")
                            Text("Line 7")
                            Text("Line 8").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 9")
                            Text("Line 10")
                            Text("Line 11")
                            Text("Line 12").padding(.bottom)
                        }
                        .font(.title2.bold())
                    }
                    .foregroundColor(.primary)
                    
                    Group {
                        Text("Line 13")
                        Text("Line 14").padding(.bottom)
                    }
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                }
                
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.darkBlue)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.darkBlue)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "e.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "f.circle.fill").foregroundColor(.darkPink)
                        Image(systemName: "e.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "f.circle.fill").foregroundColor(.darkPink)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    
                    Group {
                        Image(systemName: "g.circle.fill").foregroundColor(.purpleLearn)
                        Image(systemName: "g.circle.fill").foregroundColor(.purpleLearn)
                            .padding(.bottom, 15)
                    }
                    .font(.title2.bold())
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
            
        } else if sonnetType == .spenserianSonnet {
            HStack {
                VStack {
                    Text("Stanza 1")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 2")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 3")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 50)
                    
                    Text("S4")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                }
                .font(.title)
                .padding(.trailing, 5)
                .foregroundColor(.mainPink)
                .padding(.trailing, -30)
                
                VStack(alignment: .leading) {
                    Group {
                        Group {
                            Text("Line 1")
                            Text("Line 2")
                            Text("Line 3")
                            Text("Line 4").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 5")
                            Text("Line 6")
                            Text("Line 7")
                            Text("Line 8").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 9")
                            Text("Line 10")
                            Text("Line 11")
                            Text("Line 12").padding(.bottom)
                        }
                        .font(.title2.bold())
                    }
                    .foregroundColor(.primary)
                    
                    Group {
                        Text("Line 13")
                        Text("Line 14").padding(.bottom)
                    }
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                }
                
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "d.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    
                    Group {
                        Image(systemName: "e.circle.fill").foregroundColor(.darkBlue)
                        Image(systemName: "e.circle.fill").foregroundColor(.darkBlue)
                            .padding(.bottom, 15)
                    }
                    .font(.title2.bold())
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
            
        } else {
            Text("Something went wrong.")
        }
    }
}

//MARK: Sonnet Tutorial Card View
struct CMSonnetBodyView: View {
    
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
    
    ///Variables for determining type and index of information
    let sonnetType: NoteType
    let index: Int
    
    var body: some View {
        ZStack {
            if flipped {
                CMSonnetBack(width: self.$width, height: self.$height, sonnetType: sonnetType, index: index)
            } else {
                CMSonnetFront(width: self.$width, height: self.$height)
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

//MARK: Sonnet Tutorial Front View
struct CMSonnetFront: View {
    
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

//MARK: Sonnet Tutorial Back View
struct CMSonnetBack: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for getting width/height specified
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    ///Variables for determining type and index of information
    let sonnetType: NoteType
    let index: Int
    
    ///Get-only variable for receiving data based on type and index specified
    var bodyInfo: String {
        if sonnetType == .shakespeareanSonnet {
            return Information.shared.shakeSonnetInstructions[index]
        } else if sonnetType == .spenserianSonnet {
            return Information.shared.spenSonnetInstructions[index]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text(bodyInfo)
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
                    Text(bodyInfo)
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text(bodyInfo)
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
                    Text(bodyInfo)
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
                    Text(bodyInfo)
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        }
    }
}

//MARK: Sonnet Tutorial View Preview
struct CMSonnetView_Previews: PreviewProvider {
    static var previews: some View {
        CMSonnetView(sonnetType: .shakespeareanSonnet)
            .environmentObject(OrientationInfo())
    }
}
