//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMPromptView: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.sizeCategory) var sizeCategory
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
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                        CMPromptGenerator()
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.06)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.26)
                    }
                
                ///Optimized for any iPad in Landscape
                } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                        CMPromptGenerator()
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.06)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.26)
                    }
                
                ///Optimized for any iPhone in Portrait
                } else if horizontalSize == .compact && verticalSize == .regular {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.80)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                        CMPromptGenerator()
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.04)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.50, height: 40)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.65)
                    }
                
                ///Optimized for any iPhone in Landscape
                } else if horizontalSize == .compact && verticalSize == .compact {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.92, height: geo.size.height * 0.85)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                        CMPromptGenerator()
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.06)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.35, height: 40)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.15)
                    }
                
                ///Optimized for any iPhone Pro/Plus Landscape
                } else if horizontalSize == .regular && verticalSize == .compact {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.92, height: geo.size.height * 0.85)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                        CMPromptGenerator()
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.60)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.06)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.35, height: 40)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.15)
                    }
            }
        }
    }
}

struct CMPromptGenerator: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @State private var type = "Poem"
    let types = ["Poem", "Haiku", "Argumentative Essay", "Expository Essay", "Narrative Essay", "Informative Essay", "Shakespearean Sonnet", "Spenserian Sonnet", "Play", "Song", "Speech"]
    @State private var prompt: String = "Select a type and press the button below."
    
    var body: some View {
        VStack {
                
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
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
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
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
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                Text("Random Prompt Generator")
                    .font(.title)
                    .fontWeight(.thin)
                    .frame(width: 280, height: 100)
                
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
                    .font(.headline)
                    .fontWeight(.medium)
                    .frame(width: 280, height: 120)
                    .padding(60)
                
                Button("Generate Prompt") {
                    getPrompt()
                }
                .font(.title3)
                .buttonStyle(.borderedProminent)
                .cornerRadius(100)
                .padding()
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                HStack {
                    VStack {
                        Text("Random Prompt Generator")
                            .font(.title)
                            .fontWeight(.thin)
                        
                        Rectangle()
                            .frame(width: 200, height: 1)
                        
                        Button("Generate Prompt") {
                            getPrompt()
                        }
                        .font(.title3)
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                    
                    VStack {
                        Picker("Type", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                                    .bold()
                            }
                        }
                        .offset(x: 10, y: 150)
                        .scaleEffect(1.3)
                        .padding()
                        
                        Text(prompt)
                            .font(.headline)
                            .fontWeight(.medium)
                            .frame(width: 220, height: 400)
                            .padding(60)
                            .offset(y: -10)
                    }
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                HStack {
                    VStack {
                        Text("Random Prompt Generator")
                            .font(.title)
                            .fontWeight(.thin)
                        
                        Rectangle()
                            .frame(width: 200, height: 1)
                        
                        Button("Generate Prompt") {
                            getPrompt()
                        }
                        .font(.title3)
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                    
                    VStack {
                        Picker("Type", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                                    .bold()
                            }
                        }
                        .offset(x: 10, y: 150)
                        .scaleEffect(1.3)
                        .padding()
                        
                        Text(prompt)
                            .font(.headline)
                            .fontWeight(.medium)
                            .frame(width: 220, height: 400)
                            .padding(60)
                            .offset(y: -10)
                    }
                }
            }
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
            .environmentObject(OrientationInfo())
    }
}
