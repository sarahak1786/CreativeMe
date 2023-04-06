//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMHaikuView: View {
    
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
                
                Text("Learn to Write a Haiku")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMHaikuStructureView()
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.27)
                
                CMHaikuBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 0)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.42)
                
                CMHaikuBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 1)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.61)
                
                CMHaikuBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 2)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.80)
                
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

struct CMHaikuStructureView: View {
    var body: some View {
        HStack {
            VStack {
                Text("5").foregroundColor(.mainPink)
                Text("7").foregroundColor(.mainBlue)
                Text("5").foregroundColor(.mainPink)
            }
            .font(.title.bold())
                
            VStack {
                Rectangle()
                    .frame(width: 50, height: 1)
                    .padding(.bottom, 22)
                
                Rectangle()
                    .frame(width: 50, height: 1)
                    .padding(.bottom, 22)
                
                Rectangle()
                    .frame(width: 50, height: 1)
            }
            
            VStack(alignment: .leading) {
                Text("Watching the view glow,")
                Text("The beach seems to ebb and flow;")
                Text("Sifting the rowed sands")
            }
            .font(.title.bold())
        }
    }
}

struct CMHaikuBodyView: View {
    
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
                CMHaikuBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMHaikuFront(width: self.$width, height: self.$height)
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

struct CMHaikuFront: View {
    
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

struct CMHaikuBack: View {
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let index: Int
    
    var title: String {
        if index == 0 || index == 3 {
            return "Step #1:"
        } else if index == 1 || index == 4 {
            return "Step #2:"
        } else if index == 2 || index == 5 {
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
                Text("\(title)\n\n\(Information.shared.haikuInstructions[index])")
                    .padding(20)
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}

struct CMHaikuView_Previews: PreviewProvider {
    static var previews: some View {
        CMHaikuView()
    }
}
