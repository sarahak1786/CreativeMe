//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: About View
struct CMAboutView: View {
    
    ///Variables for orientation, dismisser, and colorScheme
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
                
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                CMAboutCard()
                
                GeometryReader { geo in
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back to Home Page")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.18)
                }
                
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                CMAboutCard()
                
                GeometryReader { geo in
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back to Home Page")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.18)
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                CMAboutCard()
                
                GeometryReader { geo in
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title3)
                            .accessibilityLabel("Back to Home Page")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.2, y: geo.frame(in: .local).minY + geo.size.height * 0.07)
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                CMAboutCard()
                
                GeometryReader { geo in
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back to Home Page")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.1, y: geo.frame(in: .local).minY + geo.size.height * 0.18)
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                CMAboutCard()
                
                GeometryReader { geo in
                    Button {
                        dismiss()
                    } label: {
                        Label("", systemImage: "arrow.left")
                            .font(.title)
                            .accessibilityLabel("Back to Home Page")
                    }
                    .position(x: geo.frame(in: .local).minX + geo.size.width * 0.1, y: geo.frame(in: .local).minY + geo.size.height * 0.18)
                }
            }
        }
    }
}

//MARK: About Card View
struct CMAboutCard: View {
    
    ///Variables for orientation and color scheme
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                    
                ///Optimized for any iPad in Portrait
                if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMAboutInformation()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                ///Optimized for any iPad in Landscape
                } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMAboutInformation()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                ///Optimized for any iPhone in Portrait
                } else if horizontalSize == .compact && verticalSize == .regular {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.95)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMAboutInformation()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                ///Optimized for any iPhone in Landscape
                } else if horizontalSize == .compact && verticalSize == .compact {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.85)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMAboutInformation()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                ///Optimized for any iPhone Pro/Plus Landscape
                } else if horizontalSize == .regular && verticalSize == .compact {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(20)
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.85)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                    CMAboutInformation()
                        .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                }
            }
        }
    }
}

//MARK: About Information View
struct CMAboutInformation: View {
    
    ///Variables for orientation and color scheme
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            ///Optimized for any iPad in Portrait
            if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                Text("Meet the Developer")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding()

                Image(decorative: "Developer")
                
                    VStack(alignment: .center) {
                        Text("Nice to meet you! 👋")
                            .font(.title2.bold())
                            .padding(5)
                            .accessibilityLabel("Nice to meet you!")
                    }
                        
                    Text("My name is Sarah and I am a self-taught iOS developer. The moment I learned about Swift and SwiftUI, it become my greatest endeavor to learn iOS development and become an app developer. My job is to make applications that change the world and make your everyday life easier. Feel free to reach out to me!")
                        .font(.title2)
                        .padding()
                
                HStack {
                    Image(systemName: "envelope.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.mainPink)
                        .colorScheme(.light)
                        .accessibilityHidden(true)
                    
                    Text("irvy1786@gmail.com")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.title2.bold())
                        .padding(5)
                        .accessibilityLabel("My email is irvy1786@gmail.com")
                    
                }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                Text("Meet the Developer")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding()

                Image(decorative: "Developer")
                
                    VStack(alignment: .center) {
                        Text("Nice to meet you! 👋")
                            .font(.title2.bold())
                            .padding(5)
                            .accessibilityLabel("Nice to meet you!")
                    }
                        
                    Text("My name is Sarah and I am a self-taught iOS developer. The moment I learned about Swift and SwiftUI, it become my greatest endeavor to learn iOS development and become an app developer. My job is to make applications that change the world and make your everyday life easier. Feel free to reach out to me!")
                        .font(.title2)
                        .padding()
                
                HStack {
                    Image(systemName: "envelope.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.mainPink)
                        .colorScheme(.light)
                        .accessibilityHidden(true)
                    
                    Text("irvy1786@gmail.com")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.title2.bold())
                        .padding(5)
                        .accessibilityLabel("My email is irvy1786@gmail.com")
                    
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                Text("Meet the Developer")
                    .font(.title2)
                    .fontWeight(.thin)
                    .padding()

                Image(decorative: "Developer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                    VStack(alignment: .center) {
                        Text("Nice to meet you! 👋")
                            .font(.title3.bold())
                            .padding(5)
                            .accessibilityLabel("Nice to meet you!")
                    }
                        
                    Text("My name is Sarah and I am a self-taught iOS developer. The moment I learned about Swift and SwiftUI, it become my greatest endeavor to learn iOS development and become an app developer. My job is to make applications that change the world and make your everyday life easier. Feel free to reach out to me!")
                        .font(.headline)
                        .fontWeight(.regular)
                        .frame(height: 290)
                        .padding(3)
                
                HStack {
                    Image(systemName: "envelope.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.mainPink)
                        .colorScheme(.light)
                        .accessibilityHidden(true)
                    
                    Text("irvy1786@gmail.com")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.headline.bold())
                        .padding(5)
                        .accessibilityLabel("My email is irvy1786@gmail.com")
                    
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                HStack {
                    VStack {
                        Image(decorative: "Developer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        
                        Text("Nice to meet you! 👋")
                            .font(.title2.bold())
                            .padding(5)
                            .accessibilityLabel("Nice to meet you!")
                        
                        HStack {
                            Image(systemName: "envelope.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityHidden(true)
                            
                            Text("irvy1786@gmail.com")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.title3.bold())
                                .padding(5)
                                .frame(width: 210)
                                .accessibilityLabel("My email is irvy1786@gmail.com")
                        }
                    }
                    
                    VStack(alignment: .center) {
                        Text("Meet the Developer")
                            .font(.title2)
                            .fontWeight(.thin)
                            .frame(width: 200, height: 10)
                            .padding(5)
                        
                        Text("My name is Sarah and I am a self-taught iOS developer. The moment I learned about Swift and SwiftUI, it become my greatest endeavor to learn iOS development and become an app developer. My job is to make applications that change the world and make your everyday life easier. Feel free to reach out to me!")
                            .font(.headline)
                            .frame(width: 350, height: 210)
                            .padding(5)
                    }
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                HStack {
                    VStack {
                        Image(decorative: "Developer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        
                        Text("Nice to meet you! 👋")
                            .font(.title2.bold())
                            .padding(5)
                            .accessibilityLabel("Nice to meet you!")
                        
                        HStack {
                            Image(systemName: "envelope.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .accessibilityHidden(true)
                            
                            Text("irvy1786@gmail.com")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.title3.bold())
                                .padding(5)
                                .frame(width: 210)
                                .accessibilityLabel("My email is irvy1786@gmail.com")
                        }
                    }
                    
                    VStack(alignment: .center) {
                        Text("Meet the Developer")
                            .font(.title2)
                            .fontWeight(.thin)
                            .frame(width: 200, height: 10)
                            .padding(5)
                        
                        Text("My name is Sarah and I am a self-taught iOS developer. The moment I learned about Swift and SwiftUI, it become my greatest endeavor to learn iOS development and become an app developer. My job is to make applications that change the world and make your everyday life easier. Feel free to reach out to me!")
                            .font(.headline)
                            .frame(width: 350, height: 210)
                            .padding(5)
                    }
                }
            }
        }
    }
}

//MARK: About View Preview
struct CMAboutView_Previews: PreviewProvider {
    static var previews: some View {
        CMAboutView()
    }
}
