//
//  EditViewButtons.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 3/10/24.
//
import SwiftUI


struct EndProcedureSheet: View {
    var body: some View {
        HStack {
            Text("End Procedure1")
                .foregroundColor(.white)
                .frame(width: 100, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
                .padding(.bottom)

            Text("End Procedure2")
                .foregroundColor(.white)
                .frame(width: 100, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
                .padding(.bottom)

            Text("End Procedure3")
                .foregroundColor(.white)
                .frame(width: 100, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
                .padding(.bottom)
            
            
            
        }
        .frame(width: 550)
        .padding()
    }
}

struct SlideUpFromBottom: ViewModifier {
    let isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .offset(y: isPresented ? 0 : UIScreen.main.bounds.height) // Adjust the value as needed
            .animation(.easeInOut(duration: 2), value: isPresented)
    }
}

extension AnyTransition {
    static var slideUpFromBottom: AnyTransition {
        .modifier(
            active: SlideUpFromBottom(isPresented: true),
            identity: SlideUpFromBottom(isPresented: false)
        )
    }
}

