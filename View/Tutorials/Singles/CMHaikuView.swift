//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMHaikuView: View {
    
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
    }
}

struct CMHaikuStructureView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink)
                    Text("7").foregroundColor(.mainBlue)
                    Text("5").foregroundColor(.mainPink)
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
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink)
                    Text("7").foregroundColor(.mainBlue)
                    Text("5").foregroundColor(.mainPink)
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
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink)
                    Text("7").foregroundColor(.mainBlue)
                    Text("5").foregroundColor(.mainPink)
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
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink)
                    Text("7").foregroundColor(.mainBlue)
                    Text("5").foregroundColor(.mainPink)
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
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            HStack {
                VStack {
                    Text("5").foregroundColor(.mainPink)
                    Text("7").foregroundColor(.mainBlue)
                    Text("5").foregroundColor(.mainPink)
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
        }
    }
}

struct CMHaikuBodyView: View {
    
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
        .onAppear(perform: setDimensions)
    }
    
    func setDimensions() {
        width = initialWidth
        height = initialHeight
    }
}

struct CMHaikuFront: View {
    
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

struct CMHaikuBack: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let index: Int
    
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

struct CMHaikuView_Previews: PreviewProvider {
    static var previews: some View {
        CMHaikuView()
            .environmentObject(OrientationInfo())
    }
}
