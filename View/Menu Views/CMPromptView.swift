//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMPromptView: View {
    
    @State private var orientation = UIDeviceOrientation.unknown
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.60)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            
                CMPromptGenerator()
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.60)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            }
        }
    }
}

struct CMPromptGenerator: View {
    
    @State private var type = ""
    let types = ["Poem", "Haiku", "Argumentative Essay", "Expository Essay", "Narrative Essay", "Informative Essay", "Shakespearean Sonnet", "Spenserian Sonnet", "Play", "Song", "Speech"]
    @State private var prompt: String = "Select a type and press the button below."
    
    var body: some View {
        VStack {
            Text("Random Prompt Generator")
                .font(.largeTitle)
                .fontWeight(.thin)
            
            Rectangle()
                .frame(width: 200, height: 1)
            
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                        .bold()
                }
            }
            .scaleEffect(1.5)
            .padding()
            
            Text(prompt)
                .font(.title)
                .fontWeight(.medium)
                .padding(60)
            
            Button("Generate Prompt") {
                getPrompt()
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
    
    func getPrompt() {
        if type == "Poem" {
            prompt = Information.shared.randomPoem.randomElement() ?? "Try Again."
        } else if type == "Haiku" {
            prompt = Information.shared.randomHaiku.randomElement() ?? "Try Again."
        } else if type == "Argumentative Essay" {
            prompt = Information.shared.randomAEssay.randomElement() ?? "Try Again."
        } else if type == "Expository Essay" {
            prompt = Information.shared.randomEEssay.randomElement() ?? "Try Again."
        } else if type == "Narrative Essay" {
            prompt = Information.shared.randomNEssay.randomElement() ?? "Try Again."
        } else if type == "Informative Essay" {
            prompt = Information.shared.randomIEssay.randomElement() ?? "Try Again."
        } else if type == "Shakespearean Sonnet" {
            prompt = Information.shared.randomShakeSonnet.randomElement() ?? "Try Again."
        } else if type == "Spenserian Sonnet" {
            prompt = Information.shared.randomSpenSonnet.randomElement() ?? "Try Again."
        } else if type == "Play" {
            prompt = Information.shared.randomPlay.randomElement() ?? "Try Again."
        } else if type == "Song" {
            prompt = Information.shared.randomSong.randomElement() ?? "Try Again."
        } else if type == "Speech" {
            prompt = Information.shared.randomSpeech.randomElement() ?? "Try Again."
        } else {
            prompt = Information.shared.randomPoem.randomElement() ?? "Try Again."
        }
    }
}

struct CMRandomPrompt_Previews: PreviewProvider {
    static var previews: some View {
        CMPromptView()
    }
}
