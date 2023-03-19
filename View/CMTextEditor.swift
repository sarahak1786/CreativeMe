//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 3/18/23.
//

import SwiftUI

struct CMTextEditor: View {
    var body: some View {
        VStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            
            CMTextEditorView()
            
            
        }
    }
}

struct CMTextEditorView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var bodyText = "Let your mind flow."
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                
                TextEditor(text: $bodyText)
                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.65)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
            }
        }
    }
}

struct CMSideBarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color.mainGray : .white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.70)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY)
            }
        }
    }
}

struct CMTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CMSideBarView()
    }
}
