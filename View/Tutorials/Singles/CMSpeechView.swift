//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMSpeechView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
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
                
                Text("Learn to Write a Speech")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMSpeechStructureView()
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.29, y: geo.frame(in: .local).minY + geo.size.height * 0.35)
                
                CMSpeechFirstStepView()
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.39)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.70, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                CMSpeechSecondStepView()
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.3, y: geo.frame(in: .local).midY + geo.size.height * 0.25)

                CMSpeechThirdStepView()
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                    .position(x: geo.frame(in: .local).maxX - geo.size.width * 0.3, y: geo.frame(in: .local).midY + geo.size.height * 0.25)
                
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

struct CMSpeechStructureView: View {
    var body: some View {
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
    }
}

struct CMSpeechFirstStepView: View {
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
                
                Text(Information.shared.speechInstructions[0])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSpeechSecondStepView: View {
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
                
                Text(Information.shared.speechInstructions[1])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSpeechThirdStepView: View {
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
                
                Text(Information.shared.speechInstructions[2])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}


struct CMSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        CMSpeechView()
    }
}
