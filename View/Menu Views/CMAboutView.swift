//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMAboutView: View {
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            CMAboutCard()
        }
    }
}

struct CMAboutCard: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                CMAboutInformation()
                    .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            }
        }
    }
}

struct CMAboutInformation: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text("Meet the Developer")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding()

            Image("Developer")
                VStack(alignment: .center) {
                    Text("Nice to meet you! 👋")
                        .font(.title2.bold())
                        .padding(5)
                }
                    
                Text("My name is Sarah and I am a self-taught iOS developer. The moment I learned about Swift and SwiftUI, it become my greatest endeavor to learn iOS development and become an app developer. My job is to make applications that change the world and make your everyday life easier. Feel free to reach out to me!")
                    .font(.title2)
                    .padding()
            
            HStack {
                Image(systemName: "envelope.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.mainPink)
                    .colorScheme(.light)
                
                Text("irvy1786@gmail.com")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.title2.bold())
                    .padding(5)
            }
        }
    }
}

struct CMAboutView_Previews: PreviewProvider {
    static var previews: some View {
        CMAboutView()
    }
}
