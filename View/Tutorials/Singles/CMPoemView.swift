//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMPoemView: View {
    var body: some View {
        CMPoemTutorialSlideOne()
    }
}

struct CMPoemTutorialSlideOne: View {
    
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
                
                Text("Learn to Write a Poem")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMPoemStructureView()
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.26)

                CMPoemBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 0)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.45)

                CMPoemBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 1)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.64)

                CMPoemBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 700, finalHeight: 200, index: 2)
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.83)
                
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
        .fullScreenCover(isPresented: $showSecondSlide, content: CMPoemTutorialSlideTwo.init)
    }
}

struct CMPoemTutorialSlideTwo: View {
    
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
                
                Text("Learn to Write a Poem")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Image("MeterExample")
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.2)

                CMPoemBodyView(initialWidth: 500, initialHeight: 125, finalWidth: 700, finalHeight: 250, index: 3)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.37)

                CMPoemBodyView(initialWidth: 500, initialHeight: 125, finalWidth: 700, finalHeight: 250, index: 4)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)

                CMPoemBodyView(initialWidth: 500, initialHeight: 125, finalWidth: 700, finalHeight: 250, index: 5)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.81)
                
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

struct CMPoemStructureView: View {
    var body: some View {
        HStack {
            VStack {
                Group {
                    Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                    Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                    Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                    Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                        .padding(.bottom, 20)
                }
                .font(.title2.bold())
                .padding(0.10)
                
                Group {
                    Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        .padding(.top, 15)
                    Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                }
                .font(.title2.bold())
                .padding(0.10)
            }
            .padding(.trailing, 1)
            
            VStack(alignment: .leading) {
                Group {
                    Text("When the curtains close in the ending of all ") + Text("mirth,").foregroundColor(.mainBlue)
                    Text("The solemn giants rest still on the shore of the ") +
                        Text("named.").foregroundColor(.mainPink)
                    Text("When does one find the new fruits of ") +
                        Text("rebirth?").foregroundColor(.mainBlue)
                    Text("Perhaps the events of the mind are one to ") +
                        Text("blame.").foregroundColor(.mainPink)
                }
                
                VStack{}.padding(5)
                
                Group {
                    Text("In the depths of the reef, the core of the ") +
                        Text("beams,").foregroundColor(.purpleRandom)
                    Text("It is only the universe’s breaths of air that ") + Text("gleams.").foregroundColor(.purpleRandom)
                }
            }
            .font(.title.bold())
        }
    }
}

struct CMPoemBodyView: View {
    
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
                CMPoemBack(width: self.$width, height: self.$height, index: index)
            } else {
                CMPoemFront(width: self.$width, height: self.$height)
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

struct CMPoemFront: View {
    
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

struct CMPoemBack: View {
    
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
                Text("\(title)\n\n\(Information.shared.poemInstructions[index])")
                    .padding(20)
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}

struct CMPoemView_Previews: PreviewProvider {
    static var previews: some View {
        CMPoemView()
    }
}
