//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Essay Tutorial View
struct CMEssayView: View {
    
    ///Variables for orientation, color scheme, selected essay type, and step count
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
                            .accessibilityLabel("Back")
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
                            .accessibilityLabel("Continue")
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

//MARK: Essay Title View
struct CMEssayTitleView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variable for selected essay type
    let essayType: NoteType
    
    ///Get-only variable converting between NoteType to String title
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

//MARK: Essay Structure View
struct CMEssayStructureView: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variable for selected essay type
    let essayType: NoteType
    
    ///Get-only variable for accessibilityLabel
    var accessibilityLabel: String {
        if essayType == .argumentativeEssay {
            return "Structure of an argumentative essay"
        } else if essayType == .expositoryEssay {
            return "Structure of an expository essay"
        } else if essayType == .narrativeEssay {
            return "Structure of a narrative essay"
        } else if essayType == .informativeEssay {
            return "Structure of an informative essay"
        } else {
            return "NA"
        }
    }
    
    ///Get-only variable for accessibilityHint
    var accessibilityHint: String {
        if essayType == .argumentativeEssay {
            return "The general structure for an argumentative essay is having an introduction paragraph, body paragraphs, a rebuttal paragraph, and a conclusion paragraph. In the introduction, you should include a hook or a compelling introduction for your audience. This can be a small story or a quote. Then, provide generation information about your topic in the introduction paragraph and conclude with a thesis statement. In your body paragraphs, include a transition sentence that involves your thesis in some way and provide two pieces of evidence. This evidence may be supported with reasoning. Think of this like making a statement such as cats are the best and then providing reasoning such as cats are soft and a great companion. Next is the rebuttal which is simply a paragraph and provides a counter argument to your argument. This would be like stating that dogs are the best. However, a rebuttal also includes a refutation, which is explaining how your argument is still correct. This would be like stating dogs are the best, but dogs are not as soft as a cat. At the end, your essay should end with a summary of your topic and end with a restatement of your thesis or a lasting thought."
        } else if essayType == .expositoryEssay {
            return "Similar to an argumentative essay, the general structure for an expository essay is having an introduction paragraph, body paragraphs, and a conclusion paragraph. In the introduction, you should include a hook or a compelling introduction for your audience. This can be a small story or a quote. Then, provide generation information about your topic in the introduction paragraph and conclude with a thesis statement. In your body paragraphs, include a transition sentence that involves your thesis in some way and provide two pieces of evidence. This evidence may be supported with reasoning. Think of this like making a statement such as cats are the best and then providing reasoning such as cats are soft and a great companion. At the end, your essay should end with a summary of your topic and end with a restatement of your thesis or a lasting thought. This may have sounded similar to an argumentative essay, but without a rebuttal paragraph. It is important to note that the main difference between these types of essays is that an expository essay is objective and should include prior research. An argumentative essay can be subjective."
        } else if essayType == .narrativeEssay {
            return "The general structure for a narrative essay is having an introduction paragraph, body paragraphs, and a conclusion paragraph. In the introduction, you should include a hook or a compelling introduction for your audience. This can be a small story or a quote. Then, provide generation information about your topic in the introduction paragraph and conclude with a thesis statement. In this case, your thesis may be the moral of your story. A narrative essay as a story that replicates the form of a plot structure. The body paragraphs in a narrative includes introducing the main story such as the beginning or exposition. The climax or the main conflict/event in the story is stated in the middle or ending body paragraph. The last body paragraph should be the resolution or a connection to the conclusion. The conclusion should be a summary and may include personal relevance such as the true importance of your moral thesis. Narratives are a story and often may be written about yourself."
        } else if essayType == .informativeEssay {
            return "The general structure for a narrative essay is having an introduction paragraph, body paragraphs, and a conclusion paragraph. In the introduction, you should include a hook or a compelling introduction for your audience. This can be a small story or a quote. Then, provide generation information about your topic in the introduction paragraph and conclude with a thesis statement. What makes an informative essay different is its thesis. The thesis should be a three point argument separated by a comma for each clause. An example is dogs are the best because they are a good friend, they are soft to pet, and they can be easy to take care of. Each body paragraph should touch upon one of the three parts in your thesis. This must be supported with reasoning and evidence as well. Lasting, the conclusion summarizes your three subsection parts of your thesis and ends with a restatement of the thesis."
        } else {
            return "NA"
        }
    }
    
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityHint(accessibilityHint)
                
            } else {
                Text("Something went wrong.")
            }
        }
    }
}

//MARK: Essay Tutorial Card View
struct CMEssayBodyView: View {
    
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
        ///Sets dimensions specified on each run
        .onAppear(perform: setDimensions)
    }
    
    ///Assigns values to each local variable
    func setDimensions() {
        width = initialWidth
        height = initialHeight
    }
}

//MARK: Essay Tutorial Front View
struct CMEssayFront: View {
    
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

//MARK: Essay Tutorial Back View
struct CMEssayBack: View {
    
    ///Variables for orientation
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    ///Variables for getting width/height specified
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    
    ///Variables for determining type and index of information
    let essayType: NoteType
    let index: Int
    
    ///Get-only variable for receiving data based on type and index specified
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
    
    ///Get-only variable for setting prefix title based on index
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

//MARK: Essay Tutorial View Preview
struct CMEssayView_Previews: PreviewProvider {
    static var previews: some View {
        CMEssayView(essayType: NoteType.argumentativeEssay)
            .environmentObject(OrientationInfo())
    }
}
