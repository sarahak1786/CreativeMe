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
        //Add place to tap next
    }
}

struct CMPoemTutorialSlideOne: View {
    
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
                
                Text("Learn to Write a Poem")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMPoemStructureView()
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.26)

                CMPoemFirstStepView(step: "First")
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.45)

                CMPoemSecondStepView(step: "First")
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.64)

                CMPoemThirdStepView(step: "First")
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
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
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Text("Learn to Write a Poem")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                Image("MeterExample")
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.2)

                CMPoemFirstStepView(step: "Second")
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.37)

                CMPoemSecondStepView(step: "Second")
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.20)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)

                CMPoemThirdStepView(step: "Second")
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

struct CMPoemFirstStepView: View {
    
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
                    Text(Information.shared.poemInstructions[0])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                } else if step == "Second" {
                    Text(Information.shared.poemInstructions[3])
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

struct CMPoemSecondStepView: View {
    
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
                    Text(Information.shared.poemInstructions[1])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                } else if step == "Second" {
                    Text(Information.shared.poemInstructions[4])
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

struct CMPoemThirdStepView: View {
    
    let step: String
    
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
                
                if step == "First" {
                    Text(Information.shared.poemInstructions[2])
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                } else if step == "Second" {
                    Text(Information.shared.poemInstructions[5])
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

struct CMPoemView_Previews: PreviewProvider {
    static var previews: some View {
        CMPoemView()
    }
}
