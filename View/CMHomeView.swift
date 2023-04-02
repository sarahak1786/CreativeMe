//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/1/23.
//

import SwiftUI

struct CMHomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Color.backgroundGradient
                    .ignoresSafeArea()
                
                ZStack {
                    GeometryReader { geo in
                        Image(colorScheme == .dark ? "CreativeMeDark" : "CreativeMeLogo")
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.1)
                            .shadow(radius: 20)
                        
                        ZStack {
                            CMInfoBarView()
                                .position(x: geo.frame(in: .local).midX * 1.6, y: geo.frame(in: .local).minY + geo.size.height * 0.58)
                            ZStack {
                                CMAddNote()
                                    .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.40)
                                
                                Rectangle()
                                    .frame(width: geo.size.width * 0.50, height: 1)
                                    .foregroundColor(.white)
                                    .position(x: geo.frame(in: .local).midX * 0.77, y: geo.frame(in: .local).minY + geo.size.height * 0.63)
                                
                                CMNoteView()
                                    .position(x: geo.frame(in: .local).midX * 0.75, y: geo.frame(in: .local).minY + geo.size.height * 0.80)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CMAddNote: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.35)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                Button() {
                    //Add Action
                } label: {
                    VStack {
                        Text("+")
                            .foregroundColor(.primary)
                            .font(.system(size: 100))
                            .fontWeight(.thin)
                        Text("New Note")
                            .foregroundColor(.primary)
                            .font(.system(size: 45))
                            .fontWeight(.thin)
                    }
                }
                .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.35)
                .contentShape(Rectangle())
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                .onTapGesture {
                    //
                }
            }
        }
    }
}

struct CMNoteView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.20)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("A Flawless Coastal Day")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .italic()
                            .padding(.leading)
                        
                        Text("Haiku")
                            .font(.title.bold())
                            .padding(.leading)
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink("View               >") {
                            
                        }
                        .cornerRadius(20)
                        .foregroundColor(.black)
                        .buttonStyle(.bordered)
                        .padding()
                        
                        Spacer()
                        
                        Text("03/18/2023")
                            .font(.title)
                            .fontWeight(.thin)
                            .padding()
                    }
                    .padding()
                }
                .padding(30)
                .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.20)
                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            }
        }
    }
}


struct CMInfoBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.13, height: geo.size.height * 0.75)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.47)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.10, height: geo.size.height * 0.85)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.50)
                }
                
                ZStack {
                    Button() {
                        //Add Action
                    } label: {
                        Image("Hamburger Bar")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.14)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Learn")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.21)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Random")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.28)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Information")
                    }
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.80)
                }
            }
        }
    }
}


struct CMHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CMHomeView()
    }
}
