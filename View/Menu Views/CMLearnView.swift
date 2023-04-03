//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

/*
 This view is not part of the main tutorial phase.
 This will be implemented separately for users to pick if they would want to learn.
  - Learn Button on HomePage
 */

import SwiftUI

struct CMLearnView: View {
    
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
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            }
        }
    }
}

struct CMTypeTutorial: View  {
    
    @State private var type: NoteType = .haiku
    @State private var imageName: String = ""
    @State private var secondImage: String = ""
    
    var body: some View {
        VStack {
            //
        }
    }
    
    func createTutorial(_ note: Note) {
        if note.type == .poem {
            imageName = "PoemExample"
        } else if note.type == .haiku {
            imageName = "HaikuExample"
        } else if note.type == .argumentativeEssay {
            imageName = "ArgumentativeExample"
        } else if note.type == .expositoryEssay {
            imageName = "ExpositoryExample"
        } else if note.type == .informativeEssay {
            imageName = "InformativeEssay"
        } else if note.type == .narrativeEssay {
            imageName = "NarrativeEssay"
        } else if note.type == .shakespeareanSonnet {
            imageName = "ShakespeareanSonnetExample"
        } else if note.type == .spenserianSonnet {
            imageName = "SpenserianSonnetExample"
        } else if note.type == .play {
            imageName = "PlayExample"
        } else if note.type == .song {
            imageName = "SongExample"
        } else if note.type == .speech {
            imageName = "SpeechExample"
        }
    }
}

struct CMLearnView_Previews: PreviewProvider {
    static var previews: some View {
        CMLearnView()
    }
}
