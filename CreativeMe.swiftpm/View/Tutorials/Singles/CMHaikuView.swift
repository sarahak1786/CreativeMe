//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Haiku Tutorial View
struct CMHaikuView: View {
    
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
                    
                    Text("Learn to Write a Haiku")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMHaikuStructureView()
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.27)
                    
                    CMHaikuBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 680, finalHeight: 200, index: 0)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.42)
                    
                    CMHaikuBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 680, finalHeight: 200, index: 1)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                    
                    CMHaikuBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 680, finalHeight: 200, index: 2)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.80)
                    
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
                    
                    Text("Learn to Write a Haiku")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMHaikuStructureView()
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.27)
                    
                    CMHaikuBodyView(initialWidth: 500, initialHeight: 80, finalWidth: 880, finalHeight: 160, index: 0)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.42)
                    
                    CMHaikuBodyView(initialWidth: 500, initialHeight: 80, finalWidth: 880, finalHeight: 160, index: 1)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.64)
                    
                    CMHaikuBodyView(initialWidth: 500, initialHeight: 80, finalWidth: 880, finalHeight: 160, index: 2)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
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
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    Text("Learn to Write a Haiku")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX - geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.21)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .haiku, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.56)
                        
                    } else if count == 1 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX - geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.21)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .haiku, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.56)
                        
                    } else if count == 2 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX - geo.size.width * 0.04, y: geo.frame(in: .local).minY + geo.size.height * 0.21)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 375, type: .haiku, index: 2)
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
                    
                    Text("Learn to Write a Haiku")
                        .font(.title2)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.23)
                        
                        CMTutorialView(initialWidth: 400, initialHeight: 100, finalWidth: 500, finalHeight: 200, type: .haiku, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                        
                    } else if count == 1 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.23)
                        
                        CMTutorialView(initialWidth: 400, initialHeight: 100, finalWidth: 500, finalHeight: 200, type: .haiku, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                        
                    } else if count == 2 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.23)
                        
                        CMTutorialView(initialWidth: 400, initialHeight: 100, finalWidth: 500, finalHeight: 200, type: .haiku, index: 2)
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
                    
                    Text("Learn to Write a Haiku")
                        .font(.title2)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    if count == 0 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.23)
                        
                        CMTutorialView(initialWidth: 400, initialHeight: 100, finalWidth: 500, finalHeight: 200, type: .haiku, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                        
                    } else if count == 1 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.23)
                        
                        CMTutorialView(initialWidth: 400, initialHeight: 100, finalWidth: 500, finalHeight: 200, type: .haiku, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                        
                    } else if count == 2 {
                        CMHaikuStructureView()
                            .scaleEffect(0.5)
                            .frame(width: 700)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.23)
                        
                        CMTutorialView(initialWidth: 400, initialHeight: 100, finalWidth: 500, finalHeight: 200, type: .haiku, index: 2)
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
                            .font(.title3)
                            .accessibilityLabel("Back")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.13, y: geo.frame(in: .local).minY + geo.size.height * 0.10)
                }
            }
        }
    }
}

//MARK: Haiku Structure View
struct CMHaikuStructureView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for accessibilityLabel and accessibilityHint
    @State private var accessibilityLabel: String = "Structure of a haiku"
    @State private var accessibilityHint: String = "A haiku is a short poem with only three lines. What makes this type of poem special is its syllables structure, which is 5, 7, and 5. The first line should have only 5 syllables, the second should have 7 and the last should have 5 as well. There is no particular rhyme scheme in a haiku."
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                    Text("7").foregroundColor(.mainBlue).colorScheme(.light)
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                }
                .font(.title.bold())
                    
                VStack {
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                }
                
                VStack(alignment: .leading) {
                    Text("Watching the view glow,")
                    Text("The beach seems to ebb and flow;")
                    Text("Sifting the rowed sands")
                }
                .font(.title.bold())
            }
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                    Text("7").foregroundColor(.mainBlue).colorScheme(.light)
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                }
                .font(.title.bold())
                    
                VStack {
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                }
                
                VStack(alignment: .leading) {
                    Text("Watching the view glow,")
                    Text("The beach seems to ebb and flow;")
                    Text("Sifting the rowed sands")
                }
                .font(.title.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                    Text("7").foregroundColor(.mainBlue).colorScheme(.light)
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                }
                .font(.title.bold())
                    
                VStack {
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                }
                
                VStack(alignment: .leading) {
                    Text("Watching the view glow,")
                    Text("The beach seems to ebb and flow;")
                    Text("Sifting the rowed sands")
                }
                .font(.title.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                    Text("7").foregroundColor(.mainBlue).colorScheme(.light)
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                }
                .font(.title.bold())
                    
                VStack {
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                }
                
                VStack(alignment: .leading) {
                    Text("Watching the view glow,")
                    Text("The beach seems to ebb and flow;")
                    Text("Sifting the rowed sands")
                }
                .font(.title.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                    Text("7").foregroundColor(.mainBlue).colorScheme(.light)
                    Text("5").foregroundColor(.mainPink).colorScheme(.light)
                }
                .font(.title.bold())
                    
                VStack {
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                        .padding(.bottom, 22)
                    
                    Rectangle()
                        .frame(width: 50, height: 1)
                }
                
                VStack(alignment: .leading) {
                    Text("Watching the view glow,")
                    Text("The beach seems to ebb and flow;")
                    Text("Sifting the rowed sands")
                }
                .font(.title.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        }
    }
}

//MARK: Haiku Tutorial Card View
struct CMHaikuBodyView: View {
    
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
                CMHaikuBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMHaikuFront(width: self.$width, height: self.$height)
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

//MARK: Haiku Tutorial Front View
struct CMHaikuFront: View {
    
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

//MARK: Haiku Tutorial Back View
struct CMHaikuBack: View {
    
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
                    Text("\(title)\n\n\(Information.shared.haikuInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.haikuInstructions[index])")
                        .padding(20)
                        .font(.title2)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(Information.shared.haikuInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.haikuInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.haikuInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        }
    }
}

//MARK: Haiku Tutorial View Preview
struct CMHaikuView_Previews: PreviewProvider {
    static var previews: some View {
        CMHaikuView()
            .environmentObject(OrientationInfo())
    }
}
