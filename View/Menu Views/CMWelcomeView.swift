//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMWelcomeView: View {
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            CMWelcomeCard()
        }
    }
}

struct CMWelcomeCard: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
//                    .shadow(radius: 5)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                CMWelcomeInformation()
                    .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            }
        }
    }
}

struct CMWelcomeInformation: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.largeTitle.bold())
                .padding()

            Text("CreativeMe helps you write better poems, sonnets, and more! Learn with interactive examples and save on our app.")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title)
            
            HStack {
                VStack {
                    Image(systemName: "graduationcap.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purpleLearn)
                        .colorScheme(.light)
                        .padding()
                    
                    Image(systemName: "square.and.pencil.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purpleRandom)
                        .colorScheme(.light)
                        .padding()
                    
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.mainPink)
                        .colorScheme(.light)
                        .padding()
                }
                
                VStack(alignment: .leading) {
                    Text("Learn through hands-on tutorials for various forms of writing. Enable tutorials before you drive into writing for a easy refresher!")
                        .font(.title2)
                        .padding()
                    
                    Text("Facing a creative mind block? Try our random prompt generator and see what you can come up under a selected time limit.")
                        .font(.title2)
                        .padding()
                    
                    Text("Discover more about the application developer behind the scenes! This app was submitted for Apple’s Swift Student Challenge for WWDC ‘23.")
                        .font(.title2)
                        .padding()
                }
            }
            
            VStack {
                Button("Let's get started!") {
                    dismiss()
                }
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(width: 600, height: 50)
                .background(Color.mainBlue)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

struct CMWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        CMWelcomeView()
    }
}
