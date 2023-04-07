//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

struct CMLearnView: View {
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ///Optimized for iPad Pro Portrait
            if (UIScreen.main.bounds.height >= 1194 && UIScreen.main.bounds.height <= 2732) && orientation.isPortrait {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        Text("Scroll through your favorite types of writing and explore an interactive tutorial taking you from start to finish!")
                            .font(.title)
                            .fontWeight(.regular)
                            .frame(width: geo.size.width * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.33)
                            .padding(.all)
                        
                        CMTutorialSlider()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.3)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.5)
                        .accessibilityLabel("Back to Home Button")
                    }
            
                ///Optimized for iPad Pro Landscape
                } else if (UIScreen.main.bounds.height >= 1194 && UIScreen.main.bounds.height <= 2732) && orientation.isLandscape {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        Text("Scroll through your favorite types of writing and explore an interactive tutorial taking you from start to finish!")
                            .font(.title)
                            .fontWeight(.regular)
                            .frame(width: geo.size.width * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.33)
                            .padding(.all)
                        
                        CMTutorialSlider()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.3)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.5)
                        .accessibilityLabel("Back to Home Button")
                    }
                
                ///Optimized for any iPad in Portrait
                } else if horizontalSize == .regular && verticalSize == .regular && orientation.isPortrait {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        Text("Scroll through your favorite types of writing and explore an interactive tutorial taking you from start to finish!")
                            .font(.title)
                            .fontWeight(.regular)
                            .frame(width: geo.size.width * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.33)
                            .padding(.all)
                        
                        CMTutorialSlider()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.3)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.5)
                        .accessibilityLabel("Back to Home Button")
                    }
                    
                ///Optimized for any iPad in Landscape
                } else if horizontalSize == .regular && verticalSize == .regular && orientation.isLandscape {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        Text("Scroll through your favorite types of writing and explore an interactive tutorial taking you from start to finish!")
                            .font(.title)
                            .fontWeight(.regular)
                            .frame(width: geo.size.width * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.33)
                            .padding(.all)
                        
                        CMTutorialSlider()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.3)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.5)
                        .accessibilityLabel("Back to Home Button")
                    }
                    
                ///Optimized for any iPhone in Portrait
                } else if horizontalSize == .compact && verticalSize == .regular {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.title)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        Text("Scroll through your favorite types of writing and explore an interactive tutorial taking you from start to finish!")
                            .font(.headline)
                            .fontWeight(.regular)
                            .frame(width: 250, height: 200)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.33)
                            .padding(.top, geo.size.height * 0.04)
                        
                        CMTutorialSlider()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.2)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 50)
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.8)
                        .accessibilityLabel("Back to Home Button")
                    }
                    
                ///Optimized for any iPhone in Landscape
                } else if horizontalSize == .compact && verticalSize == .compact {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.90)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.title3)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.12)
                        
                        Text("Scroll through your favorite types of writing!")
                            .font(.headline)
                            .fontWeight(.regular)
                            .frame(width: 600)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.34)
                            .padding(.all)
                        
                        CMTutorialSlider()
                            .frame(width: 600, height: 550)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + 30)
                        
                        Button {
                            dismiss()
                        } label: {
                            Label("", systemImage: "arrow.left")
                                .font(.title3)
                                .accessibilityLabel("Back to Home Page")
                        }
                        .position(x: geo.frame(in: .local).minX + geo.size.width * 0.1, y: geo.frame(in: .local).minY + geo.size.height * 0.18)
                    }
                    
                ///Optimized for any iPhone Pro/Plus Landscape
                } else if horizontalSize == .regular && verticalSize == .compact {
                    Color.backgroundGradient
                        .ignoresSafeArea()
                    
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        Text("Explore All Tutorials")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                        
                        Text("Scroll through your favorite types of writing and explore an interactive tutorial taking you from start to finish!")
                            .font(.title)
                            .fontWeight(.regular)
                            .frame(width: geo.size.width * 0.65)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY - geo.size.height * 0.33)
                            .padding(.all)
                        
                        CMTutorialSlider()
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.3)
                        
                        Button("Back to Home") {
                            dismiss()
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: geo.size.width * 0.60, height: 70)
                        .background(Color.purpleRandom)
                        .cornerRadius(20)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY + geo.size.width * 0.5)
                        .accessibilityLabel("Back to Home Button")
                    }
                    
            }
        }
    }
}

struct CMTutorialSlider: View {
    
    @State private var cards = [
        CMCardView(title: "Poem Tutorial", imagePreview: "PoemExample", bodyText: "Review how to write a poem!"),
        
        CMCardView(title: "Haiku Tutorial", imagePreview: "HaikuExample", bodyText: "Learn how easy it is to write a haiku."),
        
        CMCardView(title: "Argumentative Essay Tutorial", imagePreview: "ArgumentativeExample", bodyText: "Explore the art of making a defensible claim."),
        
        CMCardView(title: "Expository Essay Tutorial", imagePreview: "ExpositoryExample", bodyText: "Make your writing more in depth with expository writing."),
        
        CMCardView(title: "Narrative Essay Tutorial", imagePreview: "NarrativeExample", bodyText: "Show your creative side with a narrative review."),
        
        CMCardView(title: "Informative Essay Tutorial", imagePreview: "InformativeExample", bodyText: "Share informative more effectively than ever."),
        
        CMCardView(title: "Shakespearean Sonnet Tutorial", imagePreview: "ShakespeareSonnetExample", bodyText: "Write a sonnet the way it is meant to be!"),
        
        CMCardView(title: "Spenserian Sonnet Tutorial", imagePreview: "SpenserianSonnetExample", bodyText: "Learn the craft of other sonnet styles."),
        
        CMCardView(title: "Play Tutorial", imagePreview: "PlayCharactersExample", bodyText: "Write your own unique play!"),
        
        CMCardView(title: "Song Tutorial", imagePreview: "SongExample", bodyText: "Learn how easy it is to write your own song!"),
        
        CMCardView(title: "Speech Tutorial", imagePreview: "SpeechExample", bodyText: "Prepare yourself for your next speech."),
        
        CMCardView(title: "Random Prompt Generator", imagePreview: "PoemExample", bodyText: "Get a random prompt today!"),
        
        CMCardView(title: "You've made it to the end.", imagePreview: "CreativeMe", bodyText: "Have a nice day!😊")
    ]
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.dismiss) var dismiss
    
    @State private var poem = false
    @State private var haiku = false
    @State private var aEssay = false
    @State private var eEssay = false
    @State private var nEssay = false
    @State private var iEssay = false
    @State private var shakeSonnet = false
    @State private var spenSonnet = false
    @State private var play = false
    @State private var song = false
    @State private var speech = false
    @State private var prompt = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            ///Optimized for iPad Pro Portrait
            if (UIScreen.main.bounds.height >= 1194 && UIScreen.main.bounds.height <= 2732) && orientation.isPortrait {
                HStack(alignment: .center, spacing: 600) {
                    ForEach(cards.indices, id: \.self) { card in
                        GeometryReader { geo in
                            ZStack {
                                Rectangle()
                                    .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                    .frame(width: 600, height: 500, alignment: .center)
                                    .cornerRadius(16)
                                    .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    .padding(.top, 20)
                                
                                VStack {
                                    cards[card]
                                        .frame(width: 600, height: 600, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                
                                    Button("See More!") {
                                        getDestination(for: card)
                                    }
                                    .font(.title)
                                    .buttonStyle(.borderedProminent)
                                    .padding(.top, 10)
                                    .frame(width: 200, height: 1, alignment: .top)
                                    .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                }
                            }
                            .tag(card)
                        }
                    }
                }
                .padding(.horizontal, 100)
            
                ///Optimized for iPad Pro Landscape
                } else if (UIScreen.main.bounds.height >= 1194 && UIScreen.main.bounds.height <= 2732) && orientation.isLandscape {
                    HStack(alignment: .center, spacing: 600) {
                        ForEach(cards.indices, id: \.self) { card in
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                        .frame(width: 600, height: 500, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                        .padding(.top, 20)
                                    
                                    VStack {
                                        cards[card]
                                            .frame(width: 600, height: 600, alignment: .center)
                                            .cornerRadius(16)
                                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    
                                        Button("See More!") {
                                            getDestination(for: card)
                                        }
                                        .font(.title)
                                        .buttonStyle(.borderedProminent)
                                        .padding(.top, 10)
                                        .frame(width: 200, height: 1, alignment: .top)
                                        .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                    }
                                }
                                .tag(card)
                            }
                        }
                    }
                    .padding(.horizontal, 100)
                
                ///Optimized for any iPad in Portrait
                } else if horizontalSize == .regular && verticalSize == .regular && orientation.isPortrait {
                    HStack(alignment: .center, spacing: 600) {
                        ForEach(cards.indices, id: \.self) { card in
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                        .frame(width: 600, height: 500, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                        .padding(.top, 20)
                                    
                                    VStack {
                                        cards[card]
                                            .frame(width: 600, height: 600, alignment: .center)
                                            .cornerRadius(16)
                                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    
                                        Button("See More!") {
                                            getDestination(for: card)
                                        }
                                        .font(.title)
                                        .buttonStyle(.borderedProminent)
                                        .padding(.top, 10)
                                        .frame(width: 200, height: 1, alignment: .top)
                                        .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                    }
                                }
                                .tag(card)
                            }
                        }
                    }
                    .padding(.horizontal, 100)
                
                ///Optimized for any iPad in Landscape
                } else if horizontalSize == .regular && verticalSize == .regular && orientation.isLandscape {
                    HStack(alignment: .center, spacing: 600) {
                        ForEach(cards.indices, id: \.self) { card in
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                        .frame(width: 600, height: 500, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                        .padding(.top, 20)
                                    
                                    VStack {
                                        cards[card]
                                            .frame(width: 600, height: 600, alignment: .center)
                                            .cornerRadius(16)
                                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    
                                        Button("See More!") {
                                            getDestination(for: card)
                                        }
                                        .font(.title)
                                        .buttonStyle(.borderedProminent)
                                        .padding(.top, 10)
                                        .frame(width: 200, height: 1, alignment: .top)
                                        .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                    }
                                }
                                .tag(card)
                            }
                        }
                    }
                    .padding(.horizontal, 100)
                
                ///Optimized for any iPhone in Portrait
                } else if horizontalSize == .compact && verticalSize == .regular {
                    HStack(alignment: .center, spacing: 300) {
                        ForEach(cards.indices, id: \.self) { card in
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                        .frame(width: 300, height: 260, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                        .padding(.top, 20)
                                    
                                    VStack {
                                        cards[card]
                                            .frame(width: 400, height: 600, alignment: .center)
                                            .cornerRadius(16)
                                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    
                                        Button("See More!") {
                                            getDestination(for: card)
                                        }
                                        .font(.headline)
                                        .buttonStyle(.borderedProminent)
                                        .padding(.bottom, 100)
                                        .frame(width: 200, height: 1, alignment: .bottom)
                                        .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                    }
                                }
                                .tag(card)
                            }
                        }
                    }
                    .padding(.horizontal, 50)
                
                ///Optimized for any iPhone in Landscape
                } else if horizontalSize == .compact && verticalSize == .compact {
                    HStack(alignment: .center, spacing: 300) {
                        ForEach(cards.indices, id: \.self) { card in
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                        .frame(width: 300, height: 180, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                        .padding(.top, 20)
                                    
                                    VStack {
                                        cards[card]
                                            .frame(width: 300, height: 480, alignment: .center)
                                            .cornerRadius(16)
                                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    
                                        Button("See More!") {
                                            getDestination(for: card)
                                        }
                                        .font(.headline)
                                        .buttonStyle(.borderedProminent)
                                        .padding(.bottom, 100)
                                        .frame(width: 200, height: 1, alignment: .bottom)
                                        .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                    }
                                }
                                .tag(card)
                            }
                        }
                    }
                    .padding(.horizontal, 50)
                
                ///Optimized for any iPhone Pro/Plus Landscape
                } else if horizontalSize == .regular && verticalSize == .compact {
                    HStack(alignment: .center, spacing: 600) {
                        ForEach(cards.indices, id: \.self) { card in
                            GeometryReader { geo in
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(card % 2 == 0 ? .mainBlue : .mainPink)
                                        .frame(width: 600, height: 500, alignment: .center)
                                        .cornerRadius(16)
                                        .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                        .padding(.top, 20)
                                    
                                    VStack {
                                        cards[card]
                                            .frame(width: 600, height: 600, alignment: .center)
                                            .cornerRadius(16)
                                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    
                                        Button("See More!") {
                                            getDestination(for: card)
                                        }
                                        .font(.title)
                                        .buttonStyle(.borderedProminent)
                                        .padding(.top, 10)
                                        .frame(width: 200, height: 1, alignment: .top)
                                        .tint(card % 2 == 0 ? .mainPink : .mainBlue)
                                    }
                                }
                                .tag(card)
                            }
                        }
                    }
                    .padding(.horizontal, 100)
            }
        }
        .fullScreenCover(isPresented: $poem, content: CMPoemView.init)
        .fullScreenCover(isPresented: $haiku, content: CMHaikuView.init)
        .fullScreenCover(isPresented: $aEssay) {
            CMEssayView(essayType: NoteType.argumentativeEssay)
        }
        .fullScreenCover(isPresented: $eEssay) {
            CMEssayView(essayType: NoteType.expositoryEssay)
        }
        .fullScreenCover(isPresented: $nEssay) {
            CMEssayView(essayType: NoteType.narrativeEssay)
        }
        .fullScreenCover(isPresented: $iEssay) {
            CMEssayView(essayType: NoteType.informativeEssay)
        }
        .fullScreenCover(isPresented: $shakeSonnet) {
            CMSonnetView(sonnetType: NoteType.shakespeareanSonnet)
        }
        .fullScreenCover(isPresented: $spenSonnet) {
            CMSonnetView(sonnetType: NoteType.spenserianSonnet)
        }
        .fullScreenCover(isPresented: $play, content: CMPlayView.init)
        .fullScreenCover(isPresented: $song, content: CMSongView.init)
        .fullScreenCover(isPresented: $speech, content: CMSpeechView.init)
        .fullScreenCover(isPresented: $prompt, content: CMPromptView.init)
    }
    
    func getDestination(for index: Int) {
        switch index {
        case 0:
            poem.toggle()
        case 1:
            haiku.toggle()
        case 2:
            aEssay.toggle()
        case 3:
            eEssay.toggle()
        case 4:
            nEssay.toggle()
        case 5:
            iEssay.toggle()
        case 6:
            shakeSonnet.toggle()
        case 7:
            spenSonnet.toggle()
        case 8:
            play.toggle()
        case 9:
            song.toggle()
        case 11:
            speech.toggle()
        case 12:
            prompt.toggle()
        default:
            poem.toggle()
        }
    }
}

struct CMCardView: View {
    
    let title: String
    let imagePreview: String
    let bodyText: String
    
    @State private var orientation = UIDeviceOrientation.portrait
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ///Optimized for iPad Pro Portrait
        if (UIScreen.main.bounds.height >= 1194 && UIScreen.main.bounds.height <= 2732) && orientation.isPortrait {
            VStack(spacing: 10) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .padding(.top)
                    .colorScheme(.light)
                
                Image(imagePreview)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 150)
                    .padding()
                
                Text(bodyText)
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding()
                    .colorScheme(.light)
            }
            .background(.white)
            .cornerRadius(20)
            .padding()
        
            ///Optimized for iPad Pro Landscape
            } else if (UIScreen.main.bounds.height >= 1194 && UIScreen.main.bounds.height <= 2732) && orientation.isLandscape {
                VStack(spacing: 10) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .padding(.top)
                        .colorScheme(.light)
                    
                    Image(imagePreview)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 150)
                        .padding()
                    
                    Text(bodyText)
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding()
                        .colorScheme(.light)
                }
                .background(.white)
                .cornerRadius(20)
                .padding()
            
            ///Optimized for any iPad in Portrait
            } else if horizontalSize == .regular && verticalSize == .regular && orientation.isPortrait {
                VStack(spacing: 10) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .padding(.top)
                        .colorScheme(.light)
                    
                    Image(imagePreview)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 150)
                        .padding()
                    
                    Text(bodyText)
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding()
                        .colorScheme(.light)
                }
                .background(.white)
                .cornerRadius(20)
                .padding()
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientation.isLandscape {
                VStack(spacing: 10) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .padding(.top)
                        .colorScheme(.light)
                    
                    Image(imagePreview)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 150)
                        .padding()
                    
                    Text(bodyText)
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding()
                        .colorScheme(.light)
                }
                .background(.white)
                .cornerRadius(20)
                .padding()
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                VStack {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .colorScheme(.light)
                        .frame(width: 150, height: 70)
                        .padding()
                    
                    Text(bodyText)
                        .font(.caption)
                        .foregroundColor(.primary)
                        .colorScheme(.light)
                        .frame(width: 150, height: 40)
                        .padding(.bottom, 40)
                }
                .frame(width: 200, height: 150)
                .background(.white)
                .cornerRadius(20)
                .padding()
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                VStack {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .colorScheme(.light)
                        .frame(width: 130, height: 70)
                        .padding()
                    
                    Text(bodyText)
                        .font(.caption)
                        .foregroundColor(.primary)
                        .colorScheme(.light)
                        .frame(width: 130, height: 40)
                        .padding(.bottom, 40)
                }
                .frame(width: 200, height: 130)
                .background(.white)
                .cornerRadius(20)
                .padding()
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                VStack(spacing: 10) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .padding(.top)
                        .colorScheme(.light)
                    
                    Image(imagePreview)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 150)
                        .padding()
                    
                    Text(bodyText)
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding()
                        .colorScheme(.light)
                }
                .background(.white)
                .cornerRadius(20)
                .padding()
        }
    }
}

struct CMLearnView_Previews: PreviewProvider {
    static var previews: some View {
        CMLearnView()
    }
}
