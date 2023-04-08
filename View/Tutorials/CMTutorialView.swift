//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/7/23.
//

import SwiftUI

//MARK: Tutorial View for iPhone Adaption
struct CMTutorialView: View {
    
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
    let type: NoteType
    let index: Int
    
    var body: some View {
        ZStack {
            if flipped {
                CMTutorialBack(width: self.$width, height: self.$height, type: type, index: index)
            } else {
                CMTutorialFront(width: self.$width, height: self.$height)
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

struct CMTutorialFront: View {
    
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

struct CMTutorialBack: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let type: NoteType
    let index: Int
    
    var bodyInfo: String {
        if type == .poem {
            return Information.shared.poemInstructions[index]
        } else if type == .haiku {
            return Information.shared.haikuInstructions[index]
        } else if type == .argumentativeEssay {
            return Information.shared.aEssayInstructions[index]
        } else if type == .expositoryEssay {
            return Information.shared.eEssayInstructions[index]
        } else if type == .informativeEssay {
            return Information.shared.iEssayInstructions[index]
        } else if type == .narrativeEssay {
            return Information.shared.nEssayInstructions[index]
        } else if type == .shakespeareanSonnet {
            return Information.shared.shakeSonnetInstructions[index]
        } else if type == .spenserianSonnet {
            return Information.shared.spenSonnetInstructions[index]
        } else if type == .play {
            return Information.shared.playInstructions[index]
        } else if type == .song {
            return Information.shared.songInstructions[index]
        } else if type == .speech {
            return Information.shared.speechInstructions[index]
        } else {
            return Information.shared.poemInstructions[index]
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
                        .font(.title2)
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

struct CMTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        CMTutorialView(initialWidth: 100, initialHeight: 100, finalWidth: 200, finalHeight: 200, type: .poem, index: 0)
            .environmentObject(OrientationInfo())
    }
}
