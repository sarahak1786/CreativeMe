//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMSongView: View {
    
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
                
                Text("Learn to Write a Song")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMSongStructureView()
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.32, y: geo.frame(in: .local).minY + geo.size.height * 0.33)
                
                CMSongBodyView(initialWidth: 410, initialHeight: 200, finalWidth: 410, finalHeight: 380, index: 0)
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.26)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.63, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 220, index: 1)
                    .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.62)

                CMSongBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 220, index: 2)
                    .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
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

struct CMSongStructureView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("General Structure")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.bottom)
            
            Text("Verse 1")
                .foregroundColor(.mainPink)
                .font(.title.italic())
                .fontWeight(.medium)
                .padding(.bottom)
            
            Text("Chorus")
                .foregroundColor(.darkPurple)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("Verse 2")
                .foregroundColor(.purpleRandom)
                .font(.title.italic())
                .fontWeight(.medium)
                .padding(.bottom)
            
            Text("Chorus")
                .foregroundColor(.darkPurple)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("Bridge")
                .font(.title)
                .underline()
                .fontWeight(.medium)
                .padding(.bottom)
            
            Text("Verse 3")
                .foregroundColor(.mainBlue)
                .font(.title.italic())
                .fontWeight(.medium)
                .padding(.bottom)
            
            Text("Chorus")
                .foregroundColor(.darkPurple)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
        }
    }
}

struct CMSongBodyView: View {
    
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
                CMSongBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMSongFront(width: self.$width, height: self.$height)
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

struct CMSongFront: View {
    
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

struct CMSongBack: View {
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let index: Int
    
    var title: String {
        if index == 0 {
            return "What is a verse?"
        } else if index == 1 {
            return "What is a chorus?"
        } else if index == 2 {
            return "What is a bridge?"
        } else {
            return ""
        }
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.mainPink)
            .frame(width: self.width, height: self.height)
            .overlay(
                Text("\(title)\n\n\(Information.shared.songInstructions[index])")
                    .padding(20)
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}

struct CMSongView_Previews: PreviewProvider {
    static var previews: some View {
        CMSongView()
    }
}
