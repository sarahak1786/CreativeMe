//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMSonnetView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    let sonnetType: NoteType
    
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
                
                CMSonnetTitleView(sonnetType: sonnetType)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMSonnetStructureView(sonnetType: sonnetType)
                    .position(x: geo.frame(in: .local).minX + geo.size.height * 0.23, y: geo.frame(in: .local).midY)
                
                CMSonnetImageView(sonnetType: sonnetType)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.22)
                
                CMSonnetBodyView(initialWidth: 200, initialHeight: 300, finalWidth: 300, finalHeight: 400, sonnetType: sonnetType, index: 0)
                    .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.35)
                    .position(x: geo.frame(in: .local).midX + geo.size.height * 0.1, y: geo.frame(in: .local).minY + geo.size.height * 0.5)
                
                CMSonnetBodyView(initialWidth: 500, initialHeight: 100, finalWidth: 600, finalHeight: 200, sonnetType: sonnetType, index: 1)
                    .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.15)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.28)

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

struct CMSonnetTitleView: View {
    
    let sonnetType: NoteType
    
    var title: String {
        if sonnetType == .shakespeareanSonnet {
            return "Learn to Write a Shakespearan Sonnet"
        } else if sonnetType == .spenserianSonnet {
            return "Learn to Write an Spenserian Sonnet"
        } else {
            return "Unknown Type: Try Again."
        }
    }
    
    var body: some View {
        Text("\(title)")
            .font(.largeTitle)
            .fontWeight(.thin)
    }
}

struct CMSonnetImageView: View {
    
    let sonnetType: NoteType
    
    var title: String {
        if sonnetType == .shakespeareanSonnet {
            return "IambicShakespeareExample"
        } else if sonnetType == .spenserianSonnet {
            return "IambicSpenserianExample"
        } else {
            return "NA"
        }
    }
    
    var body: some View {
        Image(title)
    }
}

struct CMSonnetStructureView: View {
    
    let sonnetType: NoteType
    
    var body: some View {
        if sonnetType == .shakespeareanSonnet {
            HStack {
                VStack {
                    Text("Stanza 1")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 2")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 3")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 50)
                    
                    Text("S4")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                }
                .font(.title)
                .padding(.trailing, 5)
                .foregroundColor(.mainPink)
                .padding(.trailing, -30)
                
                VStack(alignment: .leading) {
                    Group {
                        Group {
                            Text("Line 1")
                            Text("Line 2")
                            Text("Line 3")
                            Text("Line 4").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 5")
                            Text("Line 6")
                            Text("Line 7")
                            Text("Line 8").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 9")
                            Text("Line 10")
                            Text("Line 11")
                            Text("Line 12").padding(.bottom)
                        }
                        .font(.title2.bold())
                    }
                    .foregroundColor(.primary)
                    
                    Group {
                        Text("Line 13")
                        Text("Line 14").padding(.bottom)
                    }
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                }
                
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.darkBlue)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.darkBlue)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "e.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "f.circle.fill").foregroundColor(.darkPink)
                        Image(systemName: "e.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "f.circle.fill").foregroundColor(.darkPink)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    
                    Group {
                        Image(systemName: "g.circle.fill").foregroundColor(.purpleLearn)
                        Image(systemName: "g.circle.fill").foregroundColor(.purpleLearn)
                            .padding(.bottom, 15)
                    }
                    .font(.title2.bold())
                }
            }
        } else if sonnetType == .spenserianSonnet {
            HStack {
                VStack {
                    Text("Stanza 1")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 2")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 90)
                    
                    Text("Stanza 3")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                        .padding(.bottom, 50)
                    
                    Text("S4")
                        .fontWeight(.regular)
                        .rotationEffect(.degrees(-90))
                }
                .font(.title)
                .padding(.trailing, 5)
                .foregroundColor(.mainPink)
                .padding(.trailing, -30)
                
                VStack(alignment: .leading) {
                    Group {
                        Group {
                            Text("Line 1")
                            Text("Line 2")
                            Text("Line 3")
                            Text("Line 4").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 5")
                            Text("Line 6")
                            Text("Line 7")
                            Text("Line 8").padding(.bottom)
                        }
                        .font(.title2.bold())
                        
                        Group {
                            Text("Line 9")
                            Text("Line 10")
                            Text("Line 11")
                            Text("Line 12").padding(.bottom)
                        }
                        .font(.title2.bold())
                    }
                    .foregroundColor(.primary)
                    
                    Group {
                        Text("Line 13")
                        Text("Line 14").padding(.bottom)
                    }
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                }
                
                VStack {
                    Group {
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "a.circle.fill").foregroundColor(.mainBlue)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "d.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "b.circle.fill").foregroundColor(.mainPink)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    .padding(.trailing, 10)
                    
                    Group {
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                        Image(systemName: "c.circle.fill").foregroundColor(.purpleRandom)
                        Image(systemName: "d.circle.fill").foregroundColor(.darkPurple)
                            .padding(.bottom, 20)
                    }
                    .font(.title2.bold())
                    
                    Group {
                        Image(systemName: "e.circle.fill").foregroundColor(.darkBlue)
                        Image(systemName: "e.circle.fill").foregroundColor(.darkBlue)
                            .padding(.bottom, 15)
                    }
                    .font(.title2.bold())
                }
            }
        } else {
            Text("Something went wrong.")
        }
    }
}

struct CMSonnetBodyView: View {
    
    @State var flipped: Bool = false
    @State var degrees: Double = 180.0
    @State var width: CGFloat = 500
    @State var height: CGFloat = 100
    
    let initialWidth: CGFloat
    let initialHeight: CGFloat
    let finalWidth: CGFloat
    let finalHeight: CGFloat
    
    let sonnetType: NoteType
    let index: Int
    
    var body: some View {
        ZStack {
            if flipped {
                CMSonnetBack(width: self.$width, height: self.$height, sonnetType: sonnetType, index: index)
            } else {
                CMSonnetFront(width: self.$width, height: self.$height)
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

struct CMSonnetFront: View {
    
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

struct CMSonnetBack: View {
    
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let sonnetType: NoteType
    let index: Int
    
    var bodyInfo: String {
        if sonnetType == .shakespeareanSonnet {
            return Information.shared.shakeSonnetInstructions[index]
        } else if sonnetType == .spenserianSonnet {
            return Information.shared.spenSonnetInstructions[index]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.mainPink)
            .frame(width: self.width, height: self.height)
            .overlay(
                Text(bodyInfo)
                    .padding(20)
                    .font(.title)
                    .foregroundColor(.white)
            )
    }
}

struct CMSonnetView_Previews: PreviewProvider {
    static var previews: some View {
        CMSonnetView(sonnetType: .shakespeareanSonnet)
    }
}
