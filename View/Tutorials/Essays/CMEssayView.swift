//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMEssayView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    let essayType: NoteType
    
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
                    
                    CMEssayTitleView(essayType: essayType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMEssayStructureView(essayType: essayType)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.3, y: geo.frame(in: .local).minY + geo.size.height * 0.35)
                    
                    CMEssayBodyView(initialWidth: 240, initialHeight: 300, finalWidth: 320, finalHeight: 450, essayType: essayType, index: 0)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.34)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.67, y: geo.frame(in: .local).minY + geo.size.height * 0.36)
                    
                    CMEssayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 210, essayType: essayType, index: 1)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.66)
                    
                    CMEssayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 210, essayType: essayType, index: 2)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.86)
                    
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.13, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                }

            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMEssayTitleView(essayType: essayType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                    
                    CMEssayStructureView(essayType: essayType)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.22, y: geo.frame(in: .local).minY + geo.size.height * 0.52)
                    
                    CMEssayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 150, essayType: essayType, index: 0)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.34)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.34)
                    
                    CMEssayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 150, essayType: essayType, index: 1)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                    
                    CMEssayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 650, finalHeight: 150, essayType: essayType, index: 2)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.76)
                    
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
                    
                    CMEssayTitleView(essayType: essayType)
                        .frame(width: geo.size.width * 0.70, height: geo.size.height * 0.15)
                        .position(x: geo.frame(in: .local).midX + geo.size.width * 0.05, y: geo.frame(in: .local).minY + geo.size.height * 0.13)
                    
                    if count == 0 {
                        CMEssayStructureView(essayType: essayType)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: essayType, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: essayType, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, type: essayType, index: 2)
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
                    
                    CMEssayTitleView(essayType: essayType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMEssayStructureView(essayType: essayType)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: essayType, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: essayType, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: essayType, index: 2)
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
                    
                    CMEssayTitleView(essayType: essayType)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                    
                    if count == 0 {
                        CMEssayStructureView(essayType: essayType)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)
                        
                    } else if count == 1 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: essayType, index: 0)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 2 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: essayType, index: 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.55)
                        
                    } else if count == 3 {
                        CMTutorialView(initialWidth: 400, initialHeight: 120, finalWidth: 500, finalHeight: 220, type: essayType, index: 2)
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

struct CMEssayTitleView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    let essayType: NoteType
    
    var title: String {
        if essayType == .argumentativeEssay {
            return "Learn to Write an Argumentative Essay"
        } else if essayType == .expositoryEssay {
            return "Learn to Write an Expository Essay"
        } else if essayType == .narrativeEssay {
            return "Learn to Write a Narrative Essay"
        } else if essayType == .informativeEssay {
            return "Learn to Write an Informative Essay"
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

struct CMEssayStructureView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    let essayType: NoteType
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
            if essayType == .argumentativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis").padding(.bottom)
                    }
                    .font(.title3.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning").padding(.bottom)
                    }
                    .font(.title3.bold())
                    
                    Text("Rebuttal Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Opposite Argument")
                        Text("     \u{2022} Refutation").padding(.bottom)
                    }
                    .font(.title3.bold())
                    
                    Text("Conclusion Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Summary")
                        Text("\u{2022} Restate Thesis")
                    }
                    .font(.title3.bold())
                }
                
            } else if essayType == .expositoryEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning").padding(.bottom)
                    }
                    .font(.title3.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Summary")
                        Text("\u{2022} Restate Thesis")
                    }
                    .font(.title3.bold())
                }
                
            } else if essayType == .narrativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis/Moral of Story").padding(.bottom)
                    }
                    .font(.title3.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Main Story")
                        Text("     \u{2022} Exposition")
                        Text("     \u{2022} Climax")
                        Text("     \u{2022} Resolution").padding(.bottom)
                    }
                    .font(.title3.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Story Summary")
                        Text("\u{2022} Personal Relevance")
                    }
                    .font(.title3.bold())
                }
                
            } else if essayType == .informativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Three-point Thesis").padding(.bottom)
                    }
                    .font(.title3.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} One of Three Main Points")
                        Text("\u{2022} Reasoning")
                        Text("\u{2022} Evidence/Data").padding(.bottom)
                    }
                    .font(.title3.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title3.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Summary")
                        Text("     \u{2022} Three Points")
                        Text("\u{2022} Reinforce Thesis")
                    }
                    .font(.title3.bold())
                }
                
            } else {
                Text("Something went wrong.")
            }
        
        ///Optimized for any iPad in Landscape
        } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
            if essayType == .argumentativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Rebuttal Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Opposite Argument")
                        Text("     \u{2022} Refutation").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Summary")
                        Text("\u{2022} Restate Thesis")
                    }
                    .font(.title2.bold())
                }
                
            } else if essayType == .expositoryEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning").padding(.bottom)
                    }
                    .font(.title2.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Summary")
                        Text("\u{2022} Restate Thesis")
                    }
                    .font(.title2.bold())
                }
                
            } else if essayType == .narrativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis/Moral of Story").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Main Story")
                        Text("     \u{2022} Exposition")
                        Text("     \u{2022} Climax")
                        Text("     \u{2022} Resolution").padding(.bottom)
                    }
                    .font(.title2.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Story Summary")
                        Text("\u{2022} Personal Relevance")
                    }
                    .font(.title2.bold())
                }
                
            } else if essayType == .informativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Three-point Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} One of Three Main Points")
                        Text("\u{2022} Reasoning")
                        Text("\u{2022} Evidence/Data").padding(.bottom)
                    }
                    .font(.title2.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Summary")
                        Text("     \u{2022} Three Points")
                        Text("\u{2022} Reinforce Thesis")
                    }
                    .font(.title2.bold())
                }
                
            } else {
                Text("Something went wrong.")
            }
        
        ///Optimized for any iPhone in Portrait
        } else if horizontalSize == .compact && verticalSize == .regular {
            if essayType == .argumentativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Rebuttal Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Opposite Argument")
                        Text("     \u{2022} Refutation").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Summary")
                        Text("\u{2022} Restate Thesis")
                    }
                    .font(.title2.bold())
                }
                
            } else if essayType == .expositoryEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning")
                        Text("\u{2022} Evidence/Claim")
                        Text("     \u{2022} Reasoning").padding(.bottom)
                    }
                    .font(.title2.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Summary")
                        Text("\u{2022} Restate Thesis")
                    }
                    .font(.title2.bold())
                }
                
            } else if essayType == .narrativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Thesis/Moral of Story").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Main Story")
                        Text("     \u{2022} Exposition")
                        Text("     \u{2022} Climax")
                        Text("     \u{2022} Resolution").padding(.bottom)
                    }
                    .font(.title2.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Story Summary")
                        Text("\u{2022} Personal Relevance")
                    }
                    .font(.title2.bold())
                }
                
            } else if essayType == .informativeEssay {
                
                VStack(alignment: .leading) {
                    Text("Structure Guidelines")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    
                    Text("Introduction Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Hook")
                        Text("\u{2022} General Information")
                        Text("\u{2022} Three-point Thesis").padding(.bottom)
                    }
                    .font(.title2.bold())
                    
                    Text("Body Paragraph(s)")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} One of Three Main Points")
                        Text("\u{2022} Reasoning")
                        Text("\u{2022} Evidence/Data").padding(.bottom)
                    }
                    .font(.title2.bold())
                   
                    Text("Conclusion Paragraph")
                        .font(.title2.italic())
                        .fontWeight(.medium)
                    
                    Group {
                        Text("\u{2022} Transition Sentence")
                        Text("\u{2022} Summary")
                        Text("     \u{2022} Three Points")
                        Text("\u{2022} Reinforce Thesis")
                    }
                    .font(.title2.bold())
                }
                
            } else {
                Text("Something went wrong.")
            }
        
        ///Optimized for any iPhone in Landscape
        } else if horizontalSize == .compact && verticalSize == .compact {
            if essayType == .argumentativeEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Thesis").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Transition Sentence")
                            Text("\u{2022} Evidence/Claim")
                            Text("     \u{2022} Reasoning").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Rebuttal Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Opposite Argument")
                            Text("     \u{2022} Refutation").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Summary")
                            Text("\u{2022} Restate Thesis")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else if essayType == .expositoryEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Thesis").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Transition Sentence")
                            Text("\u{2022} Evidence/Claim")
                            Text("     \u{2022} Reasoning")
                            Text("\u{2022} Evidence/Claim")
                            Text("     \u{2022} Reasoning").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Summary")
                            Text("\u{2022} Restate Thesis")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else if essayType == .narrativeEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Thesis/Moral of Story").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Main Story")
                            Text("     \u{2022} Exposition")
                            Text("     \u{2022} Climax")
                            Text("     \u{2022} Resolution").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Story Summary")
                            Text("\u{2022} Personal Relevance")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else if essayType == .informativeEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Three-point Thesis").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} One of Three Main Points")
                            Text("\u{2022} Reasoning")
                            Text("\u{2022} Evidence/Data").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Transition Sentence")
                            Text("\u{2022} Summary")
                            Text("     \u{2022} Three Points")
                            Text("\u{2022} Reinforce Thesis")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else {
                Text("Something went wrong.")
            }
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            if essayType == .argumentativeEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Thesis").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Transition Sentence")
                            Text("\u{2022} Evidence/Claim")
                            Text("     \u{2022} Reasoning").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Rebuttal Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Opposite Argument")
                            Text("     \u{2022} Refutation").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Summary")
                            Text("\u{2022} Restate Thesis")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else if essayType == .expositoryEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Thesis").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Transition Sentence")
                            Text("\u{2022} Evidence/Claim")
                            Text("     \u{2022} Reasoning")
                            Text("\u{2022} Evidence/Claim")
                            Text("     \u{2022} Reasoning").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Summary")
                            Text("\u{2022} Restate Thesis")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else if essayType == .narrativeEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Thesis/Moral of Story").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Main Story")
                            Text("     \u{2022} Exposition")
                            Text("     \u{2022} Climax")
                            Text("     \u{2022} Resolution").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Story Summary")
                            Text("\u{2022} Personal Relevance")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else if essayType == .informativeEssay {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Structure Guidelines")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        
                        Text("Introduction Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Hook")
                            Text("\u{2022} General Information")
                            Text("\u{2022} Three-point Thesis").padding(.bottom)
                        }
                        .font(.title3.bold())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Body Paragraph(s)")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} One of Three Main Points")
                            Text("\u{2022} Reasoning")
                            Text("\u{2022} Evidence/Data").padding(.bottom)
                        }
                        .font(.title3.bold())
                        
                        Text("Conclusion Paragraph")
                            .font(.title3.italic())
                            .fontWeight(.medium)
                        
                        Group {
                            Text("\u{2022} Transition Sentence")
                            Text("\u{2022} Summary")
                            Text("     \u{2022} Three Points")
                            Text("\u{2022} Reinforce Thesis")
                        }
                        .font(.title3.bold())
                    }
                }
                
            } else {
                Text("Something went wrong.")
            }
        }
    }
}

struct CMEssayBodyView: View {
    
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
    let essayType: NoteType
    let index: Int
    
    var body: some View {
        ZStack {
            if flipped {
                CMEssayBack(width: self.$width, height: self.$height, essayType: essayType, index: index)
            } else {
                CMEssayFront(width: self.$width, height: self.$height)
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

struct CMEssayFront: View {
    
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

struct CMEssayBack: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let essayType: NoteType
    let index: Int
    
    var bodyInfo: String {
        if essayType == .argumentativeEssay {
            return Information.shared.aEssayInstructions[index]
        } else if essayType == .expositoryEssay {
            return Information.shared.eEssayInstructions[index]
        } else if essayType == .narrativeEssay {
            return Information.shared.nEssayInstructions[index]
        } else if essayType == .informativeEssay {
            return Information.shared.iEssayInstructions[index]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var title: String {
        if index == 0 {
            return "Tip #1:"
        } else if index == 1 {
            return "Tip #2:"
        } else if index == 2 {
            return "Tip #3:"
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
                    Text("\(title)\n\n\(bodyInfo)")
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
                    Text("\(title)\n\n\(bodyInfo)")
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
                    Text("\(title)\n\n\(bodyInfo)")
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
                    Text("\(title)\n\n\(bodyInfo)")
                        .padding(20)
                        .font(.title2)
                        .foregroundColor(.white)
                )
        
        ///Optimized for any iPhone Pro/Plus Landscape
        } else if horizontalSize == .regular && verticalSize == .compact {
            Rectangle()
                .foregroundColor(Color.mainPink)
                .frame(width: self.width, height: self.height)
                .overlay(
                    Text("\(title)\n\n\(bodyInfo)")
                        .padding(20)
                        .font(.title2)
                        .foregroundColor(.white)
                )
        }
    }
}

struct CMEssayView_Previews: PreviewProvider {
    static var previews: some View {
        CMEssayView(essayType: NoteType.argumentativeEssay)
            .environmentObject(OrientationInfo())
    }
}
