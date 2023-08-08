//
//  SwiftUIView.swift
//  
//
//  Created by Sarah Akhtar on 4/8/23.
//

import SwiftUI

//MARK: Custom Save View
struct CMCustomSaveView: ViewModifier {
    
    ///Struct for individual save views
    struct SaveView {
        var title: String
        var font: Font
        var foregroundColor: Color
        var backgroundColor: Color
    }
    
    ///Variables for information and appearing
    @Binding var save: SaveView
    @Binding var appear: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if appear == true {
                withAnimation {
                    VStack {
                        HStack {
                            VStack(spacing: 2) {
                                Text(save.title)
                                    .bold()
                                    .font(save.font)
                            }
                            Spacer()
                        }
                        .frame(width: 150, height: 20)
                        .foregroundColor(save.foregroundColor)
                        .padding(12)
                        .background(save.backgroundColor)
                        .cornerRadius(50)
                        Spacer()
                    }
                    .padding()
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    
                    .onTapGesture {
                        withAnimation {
                            self.appear = false
                        }
                    }
                    
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.appear = false
                            }
                        }
                    })
                }
            }
        }
    }
}

///Extension to View for custom modifier for CMCustomSaveView
extension View {
    func saveView(save: Binding<CMCustomSaveView.SaveView>, appear: Binding<Bool>) -> some View {
        self.modifier(CMCustomSaveView(save: save, appear: appear))
    }
}

//MARK: Custom Save View Preview
struct CMCustomSaveView_Previews: PreviewProvider {
    static var previews: some View {
        Color.backgroundGradient
    }
}
