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
//                    .shadow(radius: 5)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Text("Learn to Write a Speech")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMSpeechStructureView()
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.29, y: geo.frame(in: .local).minY + geo.size.height * 0.35)
                
                CMSpeechBodyView(initialWidth: 200, initialHeight: 300, finalWidth: 340, finalHeight: 480, index: 0)
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.39)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.70, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                CMSpeechBodyView(initialWidth: 200, initialHeight: 250, finalWidth: 340, finalHeight: 400, index: 1)
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.29)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.3, y: geo.frame(in: .local).midY + geo.size.height * 0.25)

                CMSpeechBodyView(initialWidth: 200, initialHeight: 250, finalWidth: 340, finalHeight: 400, index: 2)
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

struct CMSpeechBodyView: View {
    
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
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
        .onAppear(perform: setDimensions)
    }
    
    func setDimensions() {
        width = initialWidth
        height = initialHeight
    }
}

struct CMSpeechFront: View {
    
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

struct CMSpeechBack: View {
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let index: Int
    
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

struct CMSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        CMSpeechView()
    }
}
