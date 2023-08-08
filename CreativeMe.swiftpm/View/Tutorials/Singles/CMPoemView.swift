//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Poem Tutorial View
struct CMPoemView: View {
    var body: some View {
        CMPoemTutorialSlideOne()
    }
}

//MARK: Poem Tutorial View One
struct CMPoemTutorialSlideOne: View {
    
    ///Variables for orientation, color scheme, dismisser, and step count
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showSecondSlide = false
    @State private var count: Int = 0
    
    ///Variables for accessibilityLabel and accessibilityHint
    @State private var accessibilityLabel: String = "Structure of meter"
    @State private var accessibilityHint: String = "Meter in a poem is often known as the syllable pattern in each word. A stressed syllable is typically emphasized and more pronounced such as the word out. An unstressed syllable is less emphasized such as the word of."
    
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
                    
                    Text("Learn to Write a Poem")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMPoemStructureView()
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.26)

                    CMPoemBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 200, index: 0)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.45)

                    CMPoemBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 200, index: 1)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.64)

                    CMPoemBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 200, index: 2)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.83)
                    
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
                    
                    Text("Learn to Write a Poem")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMPoemStructureView()
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.23)

                    CMPoemBodyView(initialWidth: 450, initialHeight: 80, finalWidth: 850, finalHeight: 120, index: 0)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.49)

                    CMPoemBodyView(initialWidth: 450, initialHeight: 80, finalWidth: 850, finalHeight: 120, index: 1)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.67)

                    CMPoemBodyView(initialWidth: 450, initialHeight: 80, finalWidth: 850, finalHeight: 120, index: 2)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.85)
                    
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
                    
                    Text("Learn to Write a Poem")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        CMPoemStructureView()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.27)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .poem, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.6)
                        
                    } else if count == 1 {
                        CMPoemStructureView()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.27)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .poem, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.6)
                        
                    } else if count == 2 {
                        CMPoemStructureView()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.27)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .poem, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.6)
                        
                    } else if count == 3 {
                        Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.26)
                            .accessibilityLabel(accessibilityLabel)
                            .accessibilityHint(accessibilityHint)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 350, type: .poem, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.56)
                        
                    } else if count == 4 {
                        Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.26)
                            .accessibilityLabel(accessibilityLabel)
                            .accessibilityHint(accessibilityHint)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 350, type: .poem, index: 4)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.56)
                        
                    } else if count == 5 {
                        Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.26)
                            .accessibilityLabel(accessibilityLabel)
                            .accessibilityHint(accessibilityHint)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 350, type: .poem, index: 5)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.56)
                        
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
                    
                    Text("Learn to Write a Poem")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        CMPoemStructureView()
                            .scaleEffect(0.8)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.53)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 4 {
                        Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                            .accessibilityLabel(accessibilityLabel)
                            .accessibilityHint(accessibilityHint)
                        
                    } else if count == 5 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 6 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 4)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 7 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 5)
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
                    
                    Text("Learn to Write a Poem")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        CMPoemStructureView()
                            .scaleEffect(0.8)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.53)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 2)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 4 {
                        Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                            .accessibilityLabel(accessibilityLabel)
                            .accessibilityHint(accessibilityHint)
                        
                    } else if count == 5 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 6 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 4)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.50)
                        
                    } else if count == 7 {
                        CMTutorialView(initialWidth: 400, initialHeight: 150, finalWidth: 500, finalHeight: 250, type: .poem, index: 5)
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
        .fullScreenCover(isPresented: $showSecondSlide, content: CMPoemTutorialSlideTwo.init)
    }
}

//MARK: Poem Tutorial View Two
struct CMPoemTutorialSlideTwo: View {
    
    ///Variables for orientation, color scheme, and dismissing
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    ///Variables for accessibilityLabel and accessibilityHint
    @State private var accessibilityLabel: String = "Structure of a poem"
    @State private var accessibilityHint: String = "A poem does not require a specific rhyme scheme or a pattern. However, you may want to include a rhyme scheme for a given effect. An example is an A, B, A, B and C, C rhyme scheme in which all matching letters rhyme at the end of each line. A pair of lines that rhyme together is called a couplet. However, th"
    
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
                    
                    Text("Learn to Write a Poem")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.2)
                        .accessibilityLabel(accessibilityLabel)
                        .accessibilityHint(accessibilityHint)

                    CMPoemBodyView(initialWidth: 500, initialHeight: 125, finalWidth: 700, finalHeight: 250, index: 3)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.37)

                    CMPoemBodyView(initialWidth: 500, initialHeight: 125, finalWidth: 700, finalHeight: 250, index: 4)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.60)

                    CMPoemBodyView(initialWidth: 500, initialHeight: 125, finalWidth: 700, finalHeight: 250, index: 5)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.83)
                    
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
                    
                    Text("Learn to Write a Poem")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image(colorScheme == .light ? "MeterExample" : "MeterExampleDark")
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.2)
                        .accessibilityLabel(accessibilityLabel)
                        .accessibilityHint(accessibilityHint)

                    CMPoemBodyView(initialWidth: 550, initialHeight: 100, finalWidth: 850, finalHeight: 150, index: 3)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.38)

                    CMPoemBodyView(initialWidth: 550, initialHeight: 100, finalWidth: 850, finalHeight: 150, index: 4)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.60)

                    CMPoemBodyView(initialWidth: 550, initialHeight: 100, finalWidth: 850, finalHeight: 150, index: 5)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.82)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.15, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            }
        }
    }
}

//MARK: Poem Structure View
struct CMPoemStructureView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for accessibilityLabel and accessibilityHint
    @State private var accessibilityLabel: String = "Structure of a poem"
    @State private var accessibilityHint: String = "A poem does not require a specific rhyme scheme or a pattern. However, you may want to include a rhyme scheme for a given effect. An example is an A, B, A, B and C, C rhyme scheme in which all matching letters rhyme at the end of each line. A pair of lines that rhyme together is called a couplet. However, they must be by each other to be considered a couplet. Other than that, poem are can be written as freely or structured as you'd like."
    
    var body: some View {
        HStack {
            
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                            .padding(.bottom, 10)
                    }
                    .font(.title3.bold())
                    .padding(0.0)
                    .colorScheme(.light)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                            .padding(.top, 20)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                    }
                    .font(.title2.bold())
                    .padding(0.0)
                }
                .padding(.trailing, 1)
                
                VStack(alignment: .leading) {
                    Group {
                        Text("When the curtains close in the ending of all ") + Text("mirth,").foregroundColor(.mainBlue)
                        Text("The solemn giants rest still on the shore of the ") +
                            Text("named.").foregroundColor(.mainPink)
                        Text("When does one find the new fruits of ") +
                            Text("rebirth?").foregroundColor(.mainBlue)
                        Text("Perhaps the events of the mind are one to ") +
                            Text("blame.").foregroundColor(.mainPink)
                    }
                    
                    VStack{}.padding(5)
                    
                    Group {
                        Text("In the depths of the reef, the core of the ") +
                            Text("beams,").foregroundColor(.purpleRandom)
                        Text("It is only the universe’s breaths of air that ") + Text("gleams.").foregroundColor(.purpleRandom)
                    }
                }
                .font(.title2.bold())
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                            .padding(.bottom, 10)
                    }
                    .font(.title2.bold())
                    .padding(0.0)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                            .padding(.top, 15)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                    }
                    .font(.title2.bold())
                    .padding(0.0)
                }
                .padding(.trailing, 1)
                
                VStack(alignment: .leading) {
                    Group {
                        Text("When the curtains close in the ending of all ") + Text("mirth,").foregroundColor(.mainBlue)
                        Text("The solemn giants rest still on the shore of the ") +
                            Text("named.").foregroundColor(.mainPink)
                        Text("When does one find the new fruits of ") +
                            Text("rebirth?").foregroundColor(.mainBlue)
                        Text("Perhaps the events of the mind are one to ") +
                            Text("blame.").foregroundColor(.mainPink)
                    }
                    
                    VStack{}.padding(5)
                    
                    Group {
                        Text("In the depths of the reef, the core of the ") +
                            Text("beams,").foregroundColor(.purpleRandom)
                        Text("It is only the universe’s breaths of air that ") + Text("gleams.").foregroundColor(.purpleRandom)
                    }
                }
                .font(.title2.bold())
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                            .padding(.bottom, 10)
                    }
                    .font(.caption2.bold())
                    .padding(0.0)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                            .padding(.top, 5)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                    }
                    .font(.caption2.bold())
                    .padding(0.0)
                }
                .padding(.trailing, 1)
                
                VStack(alignment: .leading) {
                    Group {
                        Text("When the curtains close in the ending of all ") + Text("mirth,").foregroundColor(.mainBlue)
                        Text("The solemn giants rest still on the shore of the ") +
                            Text("named.").foregroundColor(.mainPink)
                        Text("When does one find the new fruits of ") +
                            Text("rebirth?").foregroundColor(.mainBlue)
                        Text("Perhaps the events of the mind are one to ") +
                            Text("blame.").foregroundColor(.mainPink)
                    }
                    
                    VStack{}.padding(5)
                    
                    Group {
                        Text("In the depths of the reef, the core of the ") +
                            Text("beams,").foregroundColor(.purpleRandom)
                        Text("It is only the universe’s breaths of air that ") + Text("gleams.").foregroundColor(.purpleRandom)
                    }
                }
                .font(.caption2.bold())
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(0.10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                            .padding(.top, 15)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                    }
                    .font(.title2.bold())
                    .padding(0.10)
                }
                .padding(.trailing, 1)
                
                VStack(alignment: .leading) {
                    Group {
                        Text("When the curtains close in the ending of all ") + Text("mirth,").foregroundColor(.mainBlue)
                        Text("The solemn giants rest still on the shore of the ") +
                            Text("named.").foregroundColor(.mainPink)
                        Text("When does one find the new fruits of ") +
                            Text("rebirth?").foregroundColor(.mainBlue)
                        Text("Perhaps the events of the mind are one to ") +
                            Text("blame.").foregroundColor(.mainPink)
                    }
                    
                    VStack{}.padding(5)
                    
                    Group {
                        Text("In the depths of the reef, the core of the ") +
                            Text("beams,").foregroundColor(.purpleRandom)
                        Text("It is only the universe’s breaths of air that ") + Text("gleams.").foregroundColor(.purpleRandom)
                    }
                }
                .font(.title.bold())
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue).colorScheme(.light)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink).colorScheme(.light)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(0.10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                            .padding(.top, 15)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom).colorScheme(.light)
                    }
                    .font(.title2.bold())
                    .padding(0.10)
                }
                .padding(.trailing, 1)
                
                VStack(alignment: .leading) {
                    Group {
                        Text("When the curtains close in the ending of all ") + Text("mirth,").foregroundColor(.mainBlue)
                        Text("The solemn giants rest still on the shore of the ") +
                            Text("named.").foregroundColor(.mainPink)
                        Text("When does one find the new fruits of ") +
                            Text("rebirth?").foregroundColor(.mainBlue)
                        Text("Perhaps the events of the mind are one to ") +
                            Text("blame.").foregroundColor(.mainPink)
                    }
                    
                    VStack{}.padding(5)
                    
                    Group {
                        Text("In the depths of the reef, the core of the ") +
                            Text("beams,").foregroundColor(.purpleRandom)
                        Text("It is only the universe’s breaths of air that ") + Text("gleams.").foregroundColor(.purpleRandom)
                    }
                }
                .font(.title.bold())
            }
        }
        .accessibilityLabel(accessibilityLabel)
        .accessibilityHint(accessibilityHint)
    }
}

//MARK: Poem Tutorial Card View
struct CMPoemBodyView: View {
    
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
                CMPoemBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMPoemFront(width: self.$width, height: self.$height)
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

//MARK: Poem Tutorial Front View
struct CMPoemFront: View {
    
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

//MARK: Poem Tutorial Back View
struct CMPoemBack: View {
    
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
        if index == 0 || index == 3 {
            return "Step #1:"
        } else if index == 1 || index == 4 {
            return "Step #2:"
        } else if index == 2 || index == 5 {
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
                    Text("\(title)\n\n\(Information.shared.poemInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.poemInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.poemInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.poemInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.poemInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        }
    }
}

//MARK: Poem Tutorial View Preview
struct CMPoemView_Previews: PreviewProvider {
    static var previews: some View {
        CMPoemView()
            .environmentObject(OrientationInfo())
    }
}
