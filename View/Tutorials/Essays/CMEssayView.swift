//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMEssayView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    let essayType: NoteType
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
        
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                CMEssayTitleView(essayType: essayType)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMEssayStructureView(essayType: essayType)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.3, y: geo.frame(in: .local).minY + geo.size.height * 0.35)
                
                CMEssayFirstBodyView(essayType: essayType)
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.34)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.67, y: geo.frame(in: .local).minY + geo.size.height * 0.36)
                
                CMEssaySecondBodyView(essayType: essayType)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.65)
                
                CMEssayThirdBodyView(essayType: essayType)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.84)
                
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

struct CMEssayTitleView: View {
    
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
        Text("\(title)")
            .font(.largeTitle)
            .fontWeight(.thin)
    }
}

struct CMEssayStructureView: View {
    
    let essayType: NoteType
    
    var body: some View {
        
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
    }
}

struct CMEssayFirstBodyView: View {
    
    let essayType: NoteType
    
    var bodyOne: String {
        if essayType == .argumentativeEssay {
            return Information.shared.aEssayInstructions[0]
        } else if essayType == .expositoryEssay {
            return Information.shared.eEssayInstructions[0]
        } else if essayType == .narrativeEssay {
            return Information.shared.nEssayInstructions[0]
        } else if essayType == .informativeEssay {
            return Information.shared.iEssayInstructions[0]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Tip #1")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(bodyOne)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMEssaySecondBodyView: View {
    
    let essayType: NoteType
    
    var bodyTwo: String {
        if essayType == .argumentativeEssay {
            return Information.shared.aEssayInstructions[1]
        } else if essayType == .expositoryEssay {
            return Information.shared.eEssayInstructions[1]
        } else if essayType == .narrativeEssay {
            return Information.shared.nEssayInstructions[1]
        } else if essayType == .informativeEssay {
            return Information.shared.iEssayInstructions[1]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Tip #2")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(bodyTwo)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMEssayThirdBodyView: View {
    
    let essayType: NoteType
    
    var bodyTwo: String {
        if essayType == .argumentativeEssay {
            return Information.shared.aEssayInstructions[2]
        } else if essayType == .expositoryEssay {
            return Information.shared.eEssayInstructions[2]
        } else if essayType == .narrativeEssay {
            return Information.shared.nEssayInstructions[2]
        } else if essayType == .informativeEssay {
            return Information.shared.iEssayInstructions[2]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Tip #3")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(bodyTwo)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMEssayView_Previews: PreviewProvider {
    static var previews: some View {
        CMEssayView(essayType: NoteType.argumentativeEssay)
    }
}
