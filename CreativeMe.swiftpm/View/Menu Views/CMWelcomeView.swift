//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import SwiftUI

//MARK: Welcome View
struct CMWelcomeView: View {
    
    ///Variable for first run of application
    @Binding var firstRun: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            CMWelcomeCard(firstRun: $firstRun)
        }
    }
}

//MARK: Welcome Card View
struct CMWelcomeCard: View {
    
    ///Variables for orientation, color scheme,  dismisser and first run
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.colorScheme) var colorScheme
    @Binding var firstRun: Bool
    
    var body: some View {
            ZStack {
                
                ///Optimized for any iPad in Portrait
                if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        CMWelcomeInformation(firstRun: $firstRun)
                            .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                
                ///Optimized for any iPad in Landscape
                } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.85)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        CMWelcomeInformation(firstRun: $firstRun)
                            .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.95)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    
                    ///Optimized for any iPhone in Portrait
                } else if horizontalSize == .compact && verticalSize == .regular {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.85)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        CMWelcomeInformation(firstRun: $firstRun)
                            .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                
                ///Optimized for any iPhone in Landscape
                } else if horizontalSize == .compact && verticalSize == .compact {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.85)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        CMWelcomeInformation(firstRun: $firstRun)
                            .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                
                ///Optimized for any iPhone Pro/Plus Landscape
                } else if horizontalSize == .regular && verticalSize == .compact {
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.75)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                        
                        CMWelcomeInformation(firstRun: $firstRun)
                            .frame(width: geo.size.width * 0.60, height: geo.size.height * 0.75)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                }
            }
        }
    }
}

//MARK: Welcome Information View
struct CMWelcomeInformation: View {
    
    ///Variables for orientation, color scheme,  dismisser and first run
    @EnvironmentObject var orientationInfo: OrientationInfo
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    @Environment(\.dismiss) var dismiss
    @Binding var firstRun: Bool
    
    var body: some View {
        
        ///Optimized for any iPad in Portrait
        if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .portrait {
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
                            .accessibilityHidden(true)
                        
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.purpleRandom)
                            .colorScheme(.light)
                            .padding()
                            .accessibilityHidden(true)
                        
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.mainPink)
                            .colorScheme(.light)
                            .padding()
                            .accessibilityHidden(true)
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
                        firstRun = false
                    }
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 500, height: 50)
                    .background(Color.mainBlue)
                    .cornerRadius(20)
                    .padding()
                    .accessibilityLabel("Continue")
                }
            }
            
            ///Optimized for any iPad in Landscape
            } else if horizontalSize == .regular && verticalSize == .regular && orientationInfo.orientation == .landscape {
                VStack {
                    Text("Welcome!")
                        .font(.title.bold())
                        .padding()

                    Text("CreativeMe helps you write better poems, sonnets, and more! Learn with interactive examples and save on our app.")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title2)
                    
                    HStack {
                        VStack {
                            Image(systemName: "graduationcap.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
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
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    VStack {
                        Button("Let's get started!") {
                            dismiss()
                            firstRun = false
                        }
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: 600, height: 50)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .padding()
                        .accessibilityLabel("Continue")
                    }
                }
            
            ///Optimized for any iPhone in Portrait
            } else if horizontalSize == .compact && verticalSize == .regular {
                VStack {
                    Text("Welcome!")
                        .font(.title.bold())
                        .padding()

                    Text("CreativeMe helps you write better poems, sonnets, and more! Learn with interactive examples and save on our app.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(width: 300, height: 100)
                        .font(.headline)
                    
                    HStack {
                        VStack {
                            Image(systemName: "graduationcap.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Learn through hands-on tutorials for various forms of writing. Enable tutorials before you drive into writing for a easy refresher!")
                                .font(.caption)
                                .padding()
                            
                            Text("Facing a creative mind block? Try our random prompt generator and see what you can come up under a selected time limit.")
                                .font(.caption)
                                .padding()
                            
                            Text("Discover more about the application developer behind the scenes! This app was submitted for Apple’s Swift Student Challenge for WWDC ‘23.")
                                .font(.caption)
                                .padding()
                        }
                        .frame(width: 230, height: 320)
                    }
                    
                    VStack {
                        Button("Let's get started!") {
                            dismiss()
                            firstRun = false
                        }
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.mainBlue)
                        .cornerRadius(20)
                        .padding()
                        .accessibilityLabel("Continue")
                    }
                }
            
            ///Optimized for any iPhone in Landscape
            } else if horizontalSize == .compact && verticalSize == .compact {
                HStack {
                    VStack {
                        Text("Welcome!")
                            .font(.title.bold())
                            .padding()
                        
                        Text("CreativeMe helps you write better poems, sonnets, and more! Learn with interactive examples and save on our app.")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(width: 240, height: 110)
                            .font(.headline)
                        
                        VStack {
                            Button("Let's get started!") {
                                dismiss()
                                firstRun = false
                            }
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.mainBlue)
                            .cornerRadius(20)
                            .padding()
                            .accessibilityLabel("Continue")
                        }
                    }
                    
                    HStack {
                        VStack {
                            Image(systemName: "graduationcap.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Learn through hands-on tutorials for various forms of writing. Enable tutorials before you drive into writing for a easy refresher!")
                                .font(.caption)
                                .padding()
                            
                            Text("Facing a creative mind block? Try our random prompt generator and see what you can come up under a selected time limit.")
                                .font(.caption)
                                .padding()
                            
                            Text("Discover more about the application developer behind the scenes! This app was submitted for Apple’s Swift Student Challenge for WWDC ‘23.")
                                .font(.caption)
                                .padding()
                        }
                        .frame(width: 260, height: 320)
                    }
                }
            
            ///Optimized for any iPhone Pro/Plus Landscape
            } else if horizontalSize == .regular && verticalSize == .compact {
                HStack {
                    VStack {
                        Text("Welcome!")
                            .font(.title.bold())
                            .padding()
                        
                        Text("CreativeMe helps you write better poems, sonnets, and more! Learn with interactive examples and save on our app.")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(width: 240, height: 110)
                            .font(.headline)
                        
                        VStack {
                            Button("Let's get started!") {
                                dismiss()
                                firstRun = false
                            }
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.mainBlue)
                            .cornerRadius(20)
                            .padding()
                            .accessibilityLabel("Continue")
                        }
                    }
                    
                    HStack {
                        VStack {
                            Image(systemName: "graduationcap.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purpleLearn)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "square.and.pencil.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purpleRandom)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                            
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.mainPink)
                                .colorScheme(.light)
                                .padding()
                                .accessibilityHidden(true)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Learn through hands-on tutorials for various forms of writing. Enable tutorials before you drive into writing for a easy refresher!")
                                .font(.caption)
                                .padding()
                            
                            Text("Facing a creative mind block? Try our random prompt generator and see what you can come up under a selected time limit.")
                                .font(.caption)
                                .padding()
                            
                            Text("Discover more about the application developer behind the scenes! This app was submitted for Apple’s Swift Student Challenge for WWDC ‘23.")
                                .font(.caption)
                                .padding()
                        }
                        .frame(width: 260, height: 320)
                }
            }
        }
    }
}

//MARK: Welcome View Preview
struct CMWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        CMWelcomeView(firstRun: .constant(false))
            .environmentObject(OrientationInfo())
    }
}
