//
//  SwiftUIView.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 9/21/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
       
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "checkmark")
                .font(.system(size: 60))
                .foregroundColor(Color(red: 0.54, green: 0.68, blue: 0.97))
                .padding(.top)
            
            
            Text("•")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.54, green: 0.68, blue: 0.97))

            
            CaretShape()
                      .stroke(
                          Color(red: 0.54, green: 0.68, blue: 0.97),
                          style: StrokeStyle(lineWidth: 5, lineCap: .round)
                      )
                      .frame(width: 30, height: 30)
            
            
            
                          
                      
            
        }
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        

        
    }
}

#Preview {
    SwiftUIView()
}


struct CaretShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Calculate the center point
        let centerX = rect.midX
        let centerY = rect.midY
        
        // Determine the length of each line
        let lineLength = min(rect.width, rect.height) * 0.6 // Adjust this multiplier to change line length
        
        // Calculate the endpoints of the lines
        let leftPoint = CGPoint(
            x: centerX - (lineLength / 2),
            y: centerY + (lineLength / 2)
        )
        
        let topPoint = CGPoint(
            x: centerX,
            y: centerY - (lineLength / 2)
        )
        
        let rightPoint = CGPoint(
            x: centerX + (lineLength / 2),
            y: centerY + (lineLength / 2)
        )
        
        // Draw the left line
        path.move(to: leftPoint)
        path.addLine(to: topPoint)
        
        // Draw the right line
        path.addLine(to: rightPoint)
        
        return path
    }
}
