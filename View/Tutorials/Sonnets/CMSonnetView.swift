//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMSonnetView: View {
    
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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title2)
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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.89, y: geo.frame(in: .local).minY + geo.size.height * 0.86)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title2)
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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.89, y: geo.frame(in: .local).minY + geo.size.height * 0.86)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title2)
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.11, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                }
            }
        }
    }
}

struct CMSonnetTitleView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    let sonnetType: NoteType
    
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

struct CMSonnetImageView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    let sonnetType: NoteType
    
    var title: String {
        if sonnetType == .shakespeareanSonnet {
            return "IambicShakespeareExample"
        } else if sonnetType == .spenserianSonnet {
            return "IambicSpenserianExample"
        } else {
            return "NA"
        }
    }
    
    var body: some View {
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            Image(title)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            Image(title)
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            Image(title)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            Image(title)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            Image(title)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
        }
    }
}

struct CMSonnetStructureView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    let sonnetType: NoteType
    
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
        } else {
            Text("Something went wrong.")
        }
    }
}

struct CMSonnetBodyView: View {
    
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
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
        .onAppear(perform: setDimensions)
    }
    
    func setDimensions() {
        width = initialWidth
        height = initialHeight
    }
}

struct CMSonnetFront: View {
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.mainPink)
            .frame(width: self.width, height: self.height)
            .overlay(
                Image(systemName: "doc.plaintext")
                    .font(.largeTitle)
            )
            .foregroundColor(.white)
    }
}

struct CMSonnetBack: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let sonnetType: NoteType
    let index: Int
    
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

struct CMSonnetView_Previews: PreviewProvider {
    static var previews: some View {
        CMSonnetView(sonnetType: .shakespeareanSonnet)
            .environmentObject(OrientationInfo())
    }
}
