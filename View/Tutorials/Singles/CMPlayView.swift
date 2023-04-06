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
    }
}

struct CMPlayTutorialSlideOne: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showSecondSlide = false
    
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
                
                Text("Learn to Write a Play")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Image("PlayCharactersExample")
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 0)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.16)

                CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 1)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.34)
                
                Button {
                    dismiss()
                } label: {
                    Label("", systemImage: "arrow.left")
                        .font(.title)
                }
                .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Button {
                    showSecondSlide.toggle()
                } label: {
                    Label("", systemImage: "arrow.forward.circle.fill")
                        .font(.title)
                        .foregroundColor(.mainPink)
                }
                .position(x: geo.frame(in: .local).minX + geo.size.width * 0.8, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
            }
        }
        .fullScreenCover(isPresented: $showSecondSlide, content: CMPlayTutorialSlideTwo.init)
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
//                    .shadow(radius: 5)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Text("Learn to Write a Play")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Image("PlayDialogueExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.25)

                CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 2)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)

                CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 3)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.16)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.65)

                CMPlayBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 4)
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

struct CMPlayBodyView: View {
    
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
                CMPlayBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMPlayFront(width: self.$width, height: self.$height)
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

struct CMPlayFront: View {
    
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

struct CMPlayBack: View {
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let index: Int
    
    var title: String {
        if index == 0 {
            return "Tip #1:"
        } else if index == 1 {
            return "Tip #2:"
        } else if index == 2 {
            return "Step #1:"
        } else if index == 3 {
            return "Step #2:"
        } else if index == 4 {
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
                Text("\(title)\n\n\(Information.shared.playInstructions[index])")
                    .padding(20)
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}

struct CMPlayView_Previews: PreviewProvider {
    static var previews: some View {
        CMPlayView()
    }
}
