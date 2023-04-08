//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMPlayView: View {
    var body: some View {
        CMPlayTutorialSlideOne()
    }
}

struct CMPlayTutorialSlideOne: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showSecondSlide = false
    
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
                    
                    Text("Learn to Write a Play")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Image("PlayCharactersExample")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.40)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Button {
                        showSecondSlide.toggle()
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
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
                    
                    Image("PlayCharactersExample")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.60)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.32, y: geo.frame(in: .local).midY + geo.size.height * 0.03)

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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    Button {
                        showSecondSlide.toggle()
                    } label: {
                        Label("", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundColor(.mainPink)
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
                        Image("PlayCharactersExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                        
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
                        Image("PlayDialogueExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.25)
                        
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 350, type: .play, index: 3)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)
                        
                    } else if count == 5 {
                        Image("PlayDialogueExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.25)
                        
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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
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
                        Image("PlayCharactersExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                        
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
                        Image("PlayDialogueExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
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
                        Image("PlayCharactersExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.77, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.03)
                        
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
                        Image("PlayDialogueExample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.87, y: geo.frame(in: .local).minY + geo.size.height * 0.92)
                    
                    Button {
                        count = 0
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.13, y: geo.frame(in: .local).minY + geo.size.height * 0.10)
                }
            }
        }
        .fullScreenCover(isPresented: $showSecondSlide, content: CMPlayTutorialSlideTwo.init)
    }
}

struct CMPlayTutorialSlideTwo: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
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
                    
                    Image("PlayDialogueExample")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.25)

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
                    
                    Image("PlayDialogueExample")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.28)

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
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }
            }
        }
    }
}

struct CMPlayBodyView: View {
    
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
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
        .onAppear(perform: setDimensions)
    }
    
    func setDimensions() {
        width = initialWidth
        height = initialHeight
    }
}

struct CMPlayFront: View {
    
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

struct CMPlayBack: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let index: Int
    
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

struct CMPlayView_Previews: PreviewProvider {
    static var previews: some View {
        CMPlayView()
            .environmentObject(OrientationInfo())
    }
}
