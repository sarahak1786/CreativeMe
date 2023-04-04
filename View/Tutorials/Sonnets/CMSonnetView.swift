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
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                CMSonnetTitleView(sonnetType: sonnetType)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMSonnetStructureView(sonnetType: sonnetType)
                    .position(x: geo.frame(in: .local).minX + geo.size.height * 0.2, y: geo.frame(in: .local).midY)
                
                CMSonnetImageView(sonnetType: sonnetType)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.22)
                
                CMSonnetFirstBodyView(sonnetType: sonnetType)
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.35)
                    .position(x: geo.frame(in: .local).midX + geo.size.height * 0.1, y: geo.frame(in: .local).minY + geo.size.height * 0.5)
                
                CMSonnetSecondBodyView(sonnetType: sonnetType)
                    .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.15)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.height * 0.30)
                
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

struct CMSonnetFirstBodyView: View {
    
    let sonnetType: NoteType
    
    var bodyOne: String {
        if sonnetType == .shakespeareanSonnet {
            return Information.shared.shakeSonnetInstructions[0]
        } else if sonnetType == .spenserianSonnet {
            return Information.shared.spenSonnetInstructions[0]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(bodyOne)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSonnetSecondBodyView: View {
    
    let sonnetType: NoteType
    
    var bodyTwo: String {
        if sonnetType == .shakespeareanSonnet {
            return Information.shared.shakeSonnetInstructions[1]
        } else if sonnetType == .spenserianSonnet {
            return Information.shared.spenSonnetInstructions[1]
        } else {
            return "Unable to get information. Try again."
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(bodyTwo)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSonnetView_Previews: PreviewProvider {
    static var previews: some View {
        CMSonnetView(sonnetType: .shakespeareanSonnet)
    }
}
