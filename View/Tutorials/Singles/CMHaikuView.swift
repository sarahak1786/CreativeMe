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
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Text("Learn to Write a Haiku")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMHaikuStructureView()
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.26)
                
                CMHaikuFirstStepView()
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.40)
                
                CMHaikuSecondStepView()
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.59)
                
                CMHaikuThirdStepView()
                    .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.17)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.78)
                
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

struct CMHaikuFirstStepView: View {
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
                
                Text(Information.shared.haikuInstructions[0])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMHaikuSecondStepView: View {
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
                
                Text(Information.shared.haikuInstructions[1])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMHaikuThirdStepView: View {
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
                
                Text(Information.shared.haikuInstructions[2])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMHaikuView_Previews: PreviewProvider {
    static var previews: some View {
        CMHaikuView()
    }
}
