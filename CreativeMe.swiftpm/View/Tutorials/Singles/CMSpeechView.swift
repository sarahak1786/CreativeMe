//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Speech Tutorial View
struct CMSpeechView: View {
    
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
                    
                    Text("Learn to Write a Speech")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMSpeechStructureView()
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.29, y: geo.frame(in: .local).minY + geo.size.height * 0.365)
                    
                    CMSpeechBodyView(initialWidth: 200, initialHeight: 300, finalWidth: 330, finalHeight: 480, index: 0)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.39)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.71, y: geo.frame(in: .local).minY + geo.size.height * 0.37)

                    CMSpeechBodyView(initialWidth: 200, initialHeight: 250, finalWidth: 330, finalHeight: 380, index: 1)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.29, y: geo.frame(in: .local).midY + geo.size.height * 0.28)

                    CMSpeechBodyView(initialWidth: 200, initialHeight: 250, finalWidth: 330, finalHeight: 380, index: 2)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                        .position(x: geo.frame(in: .local).maxX - geo.size.width * 0.29, y: geo.frame(in: .local).midY + geo.size.height * 0.28)
                    
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
                    
                    Text("Learn to Write a Speech")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMSpeechStructureView()
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.24, y: geo.frame(in: .local).midY)
                    
                    CMSpeechBodyView(initialWidth: 450, initialHeight: 100, finalWidth: 650, finalHeight: 150, index: 0)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.39)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.30)

                    CMSpeechBodyView(initialWidth: 450, initialHeight: 100, finalWidth: 650, finalHeight: 150, index: 1)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.53)

                    CMSpeechBodyView(initialWidth: 450, initialHeight: 100, finalWidth: 650, finalHeight: 150, index: 2)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.76)
                    
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
                    
                    Text("Learn to Write a Speech")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.05, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                    
                    if count == 0 {
                        CMSpeechStructureView()
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.53)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: .speech, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: .speech, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: .speech, index: 2)
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
                    
                    Text("Learn to Write a Speech")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMSpeechStructureView()
                            .scaleEffect(0.52)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .speech, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .speech, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .speech, index: 2)
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
                    
                    Text("Learn to Write a Speech")
                        .font(.title)
                        .fontWeight(.thin)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMSpeechStructureView()
                            .scaleEffect(0.52)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.05)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .speech, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .speech, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: .speech, index: 2)
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

//MARK: Speech Structure View
struct CMSpeechStructureView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for accessibilityLabel and accessibilityHint
    @State private var accessibilityLabel: String = "Structure of a speech"
    @State private var accessibilityHint: String = "The general structure for a speech is having an introduction, a body, and a conclusion. In the introduction, you should include a hook or a compelling introduction for your audience. This can be a small story or a quote. Then, provide pathos or establish who you are as the speaker. This can be a simple introduction or a clever intregration of your topic into the speech. Your introduction should conclude with the main message or thesis of your speech. The body of the speech should include three different points with explanations for each one. Lastly, as you conclude your speech you may want to summarize your points and give a lasting impression on the audience. This may be through a poem, quote, or anecdote (short story)."
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            VStack(alignment: .leading) {
                Text("Structure Guidelines")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Introduction")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Strong Hook")
                    Text("\u{2022} Establish Pathos")
                    Text("     \u{2022} Introduce Yourself")
                    Text("     \u{2022} Thesis/Main Point").padding(.bottom)
                }
                .font(.title2.bold())
                
                Text("Body")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Point #1")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #2")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #3")
                    Text("     \u{2022} Detail/Explanation").padding(.bottom)
                }
                .font(.title2.bold())
               
                Text("Conclusion/Finishing Out")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Summary or Review")
                    Text("\u{2022} Lasting Words")
                    Text("     \u{2022} Quote/Anecdote/Poem")
                }
                .font(.title2.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            VStack(alignment: .leading) {
                Text("Structure Guidelines")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Introduction")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Strong Hook")
                    Text("\u{2022} Establish Pathos")
                    Text("     \u{2022} Introduce Yourself")
                    Text("     \u{2022} Thesis/Main Point").padding(.bottom)
                }
                .font(.title2.bold())
                
                Text("Body")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Point #1")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #2")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #3")
                    Text("     \u{2022} Detail/Explanation").padding(.bottom)
                }
                .font(.title2.bold())
               
                Text("Conclusion/Finishing Out")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Summary or Review")
                    Text("\u{2022} Lasting Words")
                    Text("     \u{2022} Quote/Anecdote/Poem")
                }
                .font(.title2.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            VStack(alignment: .leading) {
                Text("Structure Guidelines")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Introduction")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Strong Hook")
                    Text("\u{2022} Establish Pathos")
                    Text("     \u{2022} Introduce Yourself")
                    Text("     \u{2022} Thesis/Main Point").padding(.bottom)
                }
                .font(.title2.bold())
                
                Text("Body")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Point #1")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #2")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #3")
                    Text("     \u{2022} Detail/Explanation").padding(.bottom)
                }
                .font(.title2.bold())
               
                Text("Conclusion/Finishing Out")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Summary or Review")
                    Text("\u{2022} Lasting Words")
                    Text("     \u{2022} Quote/Anecdote/Poem")
                }
                .font(.title2.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            VStack(alignment: .leading) {
                Text("Structure Guidelines")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Introduction")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Strong Hook")
                    Text("\u{2022} Establish Pathos")
                    Text("     \u{2022} Introduce Yourself")
                    Text("     \u{2022} Thesis/Main Point").padding(.bottom)
                }
                .font(.title2.bold())
                
                Text("Body")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Point #1")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #2")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #3")
                    Text("     \u{2022} Detail/Explanation").padding(.bottom)
                }
                .font(.title2.bold())
               
                Text("Conclusion/Finishing Out")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Summary or Review")
                    Text("\u{2022} Lasting Words")
                    Text("     \u{2022} Quote/Anecdote/Poem")
                }
                .font(.title2.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            VStack(alignment: .leading) {
                Text("Structure Guidelines")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Introduction")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Strong Hook")
                    Text("\u{2022} Establish Pathos")
                    Text("     \u{2022} Introduce Yourself")
                    Text("     \u{2022} Thesis/Main Point").padding(.bottom)
                }
                .font(.title2.bold())
                
                Text("Body")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Point #1")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #2")
                    Text("     \u{2022} Detail/Explanation")
                    Text("\u{2022} Point #3")
                    Text("     \u{2022} Detail/Explanation").padding(.bottom)
                }
                .font(.title2.bold())
               
                Text("Conclusion/Finishing Out")
                    .font(.title2.italic())
                    .fontWeight(.medium)
                
                Group {
                    Text("\u{2022} Summary or Review")
                    Text("\u{2022} Lasting Words")
                    Text("     \u{2022} Quote/Anecdote/Poem")
                }
                .font(.title2.bold())
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityHint(accessibilityHint)
        }
    }
}

//MARK: Speech Tutorial Card View
struct CMSpeechBodyView: View {
    
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
                CMSpeechBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMSpeechFront(width: self.$width, height: self.$height)
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

//MARK: Speech Tutorial Front View
struct CMSpeechFront: View {
    
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

//MARK: Speech Tutorial Back View
struct CMSpeechBack: View {
    
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
            return "Step #1:"
        } else if index == 1 {
            return "Step #2:"
        } else if index == 2 {
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
                    Text("\(title)\n\n\(Information.shared.speechInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.speechInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.speechInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.speechInstructions[index])")
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
                    Text("\(title)\n\n\(Information.shared.speechInstructions[index])")
                        .padding(20)
                        .font(.title)
                        .foregroundColor(.white)
                )
        }
    }
}

//MARK: Speech Tutorial View Preview
struct CMSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        CMSpeechView()
            .environmentObject(OrientationInfo())
    }
}
