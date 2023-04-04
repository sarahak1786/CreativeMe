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
        //Add place to tap next
    }
}

struct CMPlayTutorialSlideOne: View {
    
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
                
                Text("Learn to Write a Play")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Image("PlayCharactersExample")
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                CMPlayFirstStepView(step: "First")
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.16)

                CMPlaySecondStepView(step: "First")
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.34)
                
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

struct CMPlayTutorialSlideTwo: View {
    
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
                
                Text("Learn to Write a Play")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Image("PlayDialogueExample")
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.25)

                CMPlayFirstStepView(step: "Second")
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)

                CMPlaySecondStepView(step: "Second")
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.65)

                CMPlayThirdStepView()
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.83)
                
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

struct CMPlayFirstStepView: View {
    
    let step: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Step #1")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                if step == "First" {
                    Text(Information.shared.playInstructions[0])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                } else if step == "Second" {
                    Text(Information.shared.playInstructions[2])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                } else {
                    Text("Something as gone wrong. Please try again.")
                }
            }
            .padding()
        }
    }
}

struct CMPlaySecondStepView: View {
    
    let step: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Step #2")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                if step == "First" {
                    Text(Information.shared.playInstructions[1])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                } else if step == "Second" {
                    Text(Information.shared.playInstructions[3])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                } else {
                    Text("Something as gone wrong. Please try again.")
                }
            }
            .padding()
        }
    }
}

struct CMPlayThirdStepView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("Step #3")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(Information.shared.playInstructions[4])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMPlayView_Previews: PreviewProvider {
    static var previews: some View {
        CMPlayView()
    }
}
