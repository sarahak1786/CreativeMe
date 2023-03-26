//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 3/18/23.
//

import SwiftUI

struct CMTextEditor: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Button() {
                    //Add Action
                } label: {
                    Image(colorScheme == .dark ? "RefresherDK" : "RefresherLT")
                }
                .position(x: geo.frame(in: .local).midX * 1.75, y: geo.frame(in: .local).minY + geo.size.height * 0.06)
                .shadow(radius: 10)
                
                Text("Title of Your Work")
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.06)
                    .font(.largeTitle.bold())
                
                CMTextEditorView()
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.47)
                    .padding(.bottom, 30)
                
                CMSideBarView()
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).minY + geo.size.height * 0.48)
            }
        }
    }
}

struct CMTextEditorView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var bodyText = "Let your mind flow."
    
    init() {
        UITextView.appearance().backgroundColor = .red
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(50)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(50)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                }
                
                if #available(iOS 16.0, *) {
                    TextEditor(text: $bodyText)
                        .scrollContentBackground(.hidden)
                        .background(colorScheme == .dark ? Color.mainGray : .white)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.65)
                        .cornerRadius(10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                } else {
                    TextEditor(text: $bodyText)
                        .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.65)
                        .cornerRadius(10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                }
            }
        }
    }
}

struct CMSideBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                } else {
                    Rectangle()
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.10)
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY * 0.92)
                }
                
                HStack {
                    Button() {
                        //Add Action
                    } label: {
                        Image("Back")
                    }
                    .position(x: geo.frame(in: .local).midX * 0.30, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Save")
                    }
                    .position(x: geo.frame(in: .local).midX * 0.06, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Underline")
                    }
                    .position(x: geo.frame(in: .local).midX * 0.45, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Bold")
                    }
                    .position(x: geo.frame(in: .local).midX * 0.25, y: geo.frame(in: .local).maxY * 0.92)
                    
                    Button() {
                        //Add Action
                    } label: {
                        Image("Italics")
                    }
                    .position(x: geo.frame(in: .local).midX * 0.05, y: geo.frame(in: .local).maxY * 0.92)
                    
                }
            }
        }
    }
}

struct CMTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CMTextEditor()
        CMTextEditorView()
        CMSideBarView()
    }
}
