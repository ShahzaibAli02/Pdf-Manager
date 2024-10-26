//
//  AdditionalNotes.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 9/13/24.
//

import SwiftUI

struct AdditionalNotes: View {
    @ObservedObject var userData: UserEntryData
    @Binding var showNotes: Bool // Binding to control the sheet visibility

    var body: some View {
        VStack(alignment: .leading) {
            Text("Additional Notes")
                .font(Font.custom("Inter", size: 24).weight(.semibold))
                .kerning(0.24)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .padding(.bottom, -1.0)
            
            // Bind the TextEditor directly to userData.additionalNotes
            TextEditor(text: $userData.AdditionalNotes)
                .frame(width: 600.0, height: 800) // Adjust the width and height as needed
                .border(Color.gray, width: 1)
                .padding()
            
            // Add a button at the bottom to close the sheet
            Button(action: {
                showNotes = false // This will close the sheet
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                    .cornerRadius(10)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    AdditionalNotes(userData: UserEntryData(), showNotes: .constant(true))
}

