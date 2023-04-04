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
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.90, height: geo.size.height * 0.95)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Text("Learn to Write a Song")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                
                CMSongStructureView()
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.32, y: geo.frame(in: .local).minY + geo.size.height * 0.33)
                
                CMSongFirstStepView()
                    .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.26)
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.65, y: geo.frame(in: .local).minY + geo.size.height * 0.35)

                CMSongSecondStepView()
                    .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.19)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.62)

                CMSongThirdStepView()
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

struct CMSongFirstStepView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("What is a verse?")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(Information.shared.songInstructions[0])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSongSecondStepView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("What is a chorus?")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(Information.shared.songInstructions[1])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSongThirdStepView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mainPink)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("What is a bridge?")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text(Information.shared.songInstructions[2])
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding()
        }
    }
}

struct CMSongView_Previews: PreviewProvider {
    static var previews: some View {
        CMSongView()
    }
}
