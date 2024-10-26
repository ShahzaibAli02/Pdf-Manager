//
//  MedHisB.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/5/24.
//

import Foundation

import SwiftUI


struct MedHisB: View {
    
    @ObservedObject var userData: UserEntryData
    
    @State private var showNotes = false
    
    @State private var isAnimating = false
    @State private var ErrorMessage: String = ""
    @State private var NavigateNextView: Bool = false
    
    @State private var RenalOtherTextError = ""
    @State private var LabsError = ""
    
    let commonText = CommonText()
    

    
    var body: some View {
        NavigationStack{
            
            Group{
                // Title
                Text("Medical History Part 2")
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .frame(width: 308, height: 28, alignment: .center)
                    
                
                // Progress Bar
                HStack{
                    // Bar 1
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 24.90, height: 19)
                        .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                        .cornerRadius(10)
                    // Bar 2
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 143.44, height: 19)
                        .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                        .cornerRadius(10)
                    // Bar 3
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 82.68, height: 19)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    // Bar 4
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 24.90, height: 19)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    // Bar 5
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 289.86, height: 19)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    
                    // Bar 6
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 24.90, height: 19)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    // Bar 7
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 143.44, height: 19)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    
                    Button(action: {
                                    showNotes.toggle()
                    }) {
                        
                        
                        AdditionalNotesSymbol(isAnimating: $isAnimating)
                        
                    }

                    
                }
                
                
            }
            
            ScrollView{
                
               
            
            VStack(alignment: .leading, spacing: 20) {
                
                
                

                

/*---------------------------------------------------------------
         
 Renal SECTION 1
*/
        HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
            
            // VStack for the circle and vertical line
            VStack {
                CircleOne()
                    .padding([.bottom], 0) // Adjust padding as needed
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 180) // Adjust height as needed
                
            }
            
// VStack for Section 5
            
            VStack(alignment: .leading, spacing: 8) {
                // Procedure Info Text
                Text("Renal")
                    .font(
                        Font.custom("Inter", size: 24)
                            .weight(.semibold)
                    )
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .frame(width: 187, height: 63.12318, alignment: .leading)
                
                

// Renal Condition Text
               
Group{

Text("Select Conditions That Apply:")
    .font(Font.custom("Inter", size: 14))
    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

VStack(alignment: .leading, spacing: 20) {
    Button(action: {
        withAnimation {
            userData.isRenalExpanded.toggle()
        }
    }) {
        
        
        HStack {
               Text("Renal Options")
                .padding([.top, .leading, .bottom])
                   .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                   .font(
                       Font.custom("Inter", size: 18)
                           .weight(.semibold))

               // Arrow to the right of the text
               Image(systemName: userData.isRenalExpanded ? "chevron.up" : "chevron.down")
                   .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                   .padding(.trailing)
           }
           .background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
           .cornerRadius(8) // Apply corner radius to the entire HStack
    }

    if userData.isRenalExpanded {
        VStack {
            RenalDropdownMenu(userData: userData)
                .frame(width: 250) // Adjust the width here
                //.frame(height: 250)
                .background(Color.white)
                .border(Color.gray, width: 1)
                .cornerRadius(8)
                .shadow(radius: 5)
        }
        .padding(.top, 5) // Adjust the top padding as needed
    }
    
    
//Display your answers
    Group{
        
        Text("Selected Conditions Below:")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        if userData.RenalWNL {
                
                    Text("WNL")
                        .multilineTextAlignment(.leading)
                        .frame(width: 100, height: 42.65168)
                        .foregroundColor(.black)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                
            }

            if userData.RenalCKD {
              
                    Text("Dementia")
                        .multilineTextAlignment(.leading)
                        .frame(width: 130, height: 42.65168)
                        .foregroundColor(.black)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                
            }

            if userData.RenalBPH {
               
                    Text("BHB")
                        .multilineTextAlignment(.leading)
                        .frame(width: 150, height: 42.65168)
                        .foregroundColor(.black)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                }
    

            if userData.RenalESRD {
                
                    Text("ESRD")
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
            }



            if userData.RenalOther {
                
                
                HStack(alignment:.center){

                    TextField("Enter Renal Other", text: $userData.RenalOtherText)
                           .onChange(of: userData.RenalOtherText) { newValue in
                               if newValue.count > 15 {
           RenalOtherTextError = "Character limit reached. \nAdd more info to notes"
                                   isAnimating = true
                               } else {
                                   RenalOtherTextError = ""
                                   isAnimating = false
                               }
                           }
                        .multilineTextAlignment(.leading)
                        .frame(width: 192, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                    
                    Text(RenalOtherTextError)
                        .foregroundColor(.red)
                        .font(
                            Font.custom("Inter", size: 15)
                                .weight(.bold)
                        )
                        .frame(maxWidth: 400, alignment: .leading) //
                        .lineLimit(nil) //
                    
        }

                
        }

                        
        }// End of display group
                    
                    
        }
                
                    
        }
                
        }
            
        }
                
         
                
/*---------------------------------------------------------------
     
     
 Airway SECTION 2
*/
    
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        VStack {
            CircleTwo()
                .padding([.bottom], 5) // Adjust padding as needed
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 60) // Adjust height as needed
            
            
        }
        
        

// VStack for the "Cardio Vascular" and its related fields

VStack(alignment: .leading, spacing: 20) {
    // Sub head
    Text("Airway")
        .font(
            Font.custom("Inter", size: 24)
                .weight(.semibold)
        )
        .kerning(0.24)
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .frame(width: 187, height: 63.12318, alignment: .leading)
    
    
    
    HStack {
        
        Text("MP:")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        Button(action: {
            userData.Airway1.toggle()
        }) {
            
            Image(systemName: userData.Airway1 ? "checkmark.square" : "square")
                .foregroundColor(userData.Airway1 ? .black : .gray) // Change the color here
            Text("1")
                .foregroundColor(userData.Airway1 ? .black : .gray)
            
        }
        
        
        Button(action: {
            userData.Airway2.toggle()
        }) {
            
            Image(systemName: userData.Airway2 ? "checkmark.square" : "square")
                .foregroundColor(userData.Airway2 ? .black : .gray) // Change the color here
            Text("2")
                .foregroundColor(userData.Airway2 ? .black : .gray)
            
        }
        .padding(.leading)
        
        Button(action: {
            userData.Airway3.toggle()
        }) {
            
            Image(systemName: userData.Airway3 ? "checkmark.square" : "square")
                .foregroundColor(userData.Airway3 ? .black : .gray) // Change the color here
            Text("3")
                .foregroundColor(userData.Airway3 ? .black : .gray)
            
        }
        
        
        Button(action: {
            userData.Airway4.toggle()
        }) {
            
            Image(systemName: userData.Airway4 ? "checkmark.square" : "square")
                .foregroundColor(userData.Airway4 ? .black : .gray) // Change the color here
            Text("4")
                .foregroundColor(userData.Airway4 ? .black : .gray)
            
        }
        .padding(.leading)
        
        
        
    }
    .padding(.bottom)
    
    
    
    
}


}



/*---------------------------------------------------------------


 Dentition Section 3
*/
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed

// VStack for the circle and vertical line
VStack {
    CircleThree()
        .padding([.bottom], 5) // Adjust padding as needed
    
    Rectangle()
        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
        .frame(width: 1, height: 50) // Adjust height as needed
    
    
    
    
    
}



VStack(alignment: .leading, spacing: 8) {
    
    Text("Dentition")
        .font(
            Font.custom("Inter", size: 24)
                .weight(.semibold)
        )
        .kerning(0.24)
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .frame(width: 187, height: 63.12318, alignment: .leading)
    
    
    //Dentition Button
    
    HStack {
        
        Text("")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        Button(action: {
            userData.DentitionIntact.toggle()
        }) {
            
            Image(systemName: userData.DentitionIntact ? "checkmark.square" : "square")
                .foregroundColor(userData.DentitionIntact ? .black : .gray) // Change the color here
            Text("Intact")
                .foregroundColor(userData.DentitionIntact ? .black : .gray)
            
        }
        
        
        Button(action: {
            userData.DentitionLoose.toggle()
        }) {
            
            Image(systemName: userData.DentitionLoose ? "checkmark.square" : "square")
                .foregroundColor(userData.DentitionLoose ? .black : .gray) // Change the color here
            Text("Loose")
                .foregroundColor(userData.DentitionLoose ? .black : .gray)
            
        }
        .padding(.leading)
        
        Button(action: {
            userData.DentitionBridge.toggle()
        }) {
            
            Image(systemName: userData.DentitionBridge ? "checkmark.square" : "square")
                .foregroundColor(userData.DentitionBridge ? .black : .gray) // Change the color here
            Text("Bridge")
                .foregroundColor(userData.DentitionBridge ? .black : .gray)
            
        }
        
        
        Button(action: {
            userData.DentitionCap.toggle()
        }) {
            
            Image(systemName: userData.DentitionCap ? "checkmark.square" : "square")
                .foregroundColor(userData.DentitionCap ? .black : .gray) // Change the color here
            Text("Cap")
                .foregroundColor(userData.DentitionCap ? .black : .gray)
            
        }
        .padding(.leading)
        
        
        
    }
    .padding(.bottom)
    
    
    
    
}

}

/*---------------------------------------------------------------

Labs Section 4
*/


HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed

// VStack for the circle and vertical line
VStack {
    CircleFour()
        .padding([.bottom], 5) // Adjust padding as needed
    
    Rectangle()
        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
        .frame(width: 1, height: 400) // Adjust height as needed
    
}



VStack(alignment: .leading, spacing: 8) {
    // Procedure Info Text
    
    HStack(alignment: .center){
        Text("Labs")
            .font(
                Font.custom("Inter", size: 24)
                    .weight(.semibold)
            )
            .kerning(0.24)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 77, height: 63.12318, alignment: .leading)
        
        Text(LabsError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading)
                .lineLimit(nil)
        
    }
    
    // Labs 1 Graphic
    Group{
        ZStack{
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 265, height: 1) // Adjust height as needed
                .offset(x:-45,y:0)
            HStack(alignment: .center ){
                
                
                //Labs One 1 & 2 Text Box
                VStack{
                    
                    TextField("", text: $userData.LabsOne1)
                             .onChange(of: userData.LabsOne1) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:-8)
                    
                    TextField("", text: $userData.LabsOne2)
                             .onChange(of: userData.LabsOne2) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:8)
                    
                }
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 75) // Adjust height as needed
                
                //Labs One 3 & 4 Text Box
                VStack{
                    
                    TextField("", text: $userData.LabsOne3)
                             .onChange(of: userData.LabsOne3) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:-8)
                    
                    TextField("", text: $userData.LabsOne4)
                             .onChange(of: userData.LabsOne4) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:8)
                    
                }
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 75) // Adjust height as needed
                
                //Labs One 5 & 6 Text Box
                VStack{
                    
                    TextField("", text: $userData.LabsOne5)
                             .onChange(of: userData.LabsOne5) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:-8)
                    
                    
                    TextField("", text: $userData.LabsOne6)
                             .onChange(of: userData.LabsOne6) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:8)
                }
                
                
                // Horizontal and Angled Lines
                ZStack(alignment: .bottom) {
                    
                    
                    Group{
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 75)
                            .rotationEffect(.degrees(45), anchor: .bottom)
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 75)
                            .rotationEffect(.degrees(135), anchor: .bottom)
                        
                        
                        
                        
                    }
                    .offset(x:0,y:-37.5)
                    
                }
                
                
                
                //Labs One 7 Text Box
                
              
                    
                TextField("", text: $userData.LabsOne7)
                         .onChange(of: userData.LabsOne7) { newValue in
                             if newValue.count > 6 {
                                 LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                             } else {
                                 LabsError = ""
                       isAnimating = false
                             }
                         }
                      .frame(width: 71, height: 36.5)
                      .padding(.leading, 10)
                      .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                      .cornerRadius(16)
                      .offset(x:20,y:0)
                
                
                
            }
            
        } // End of ZStack
    }
    .padding(.bottom)
    
    
    
    // Labs 2 Graphic
    Group{
        ZStack{
            
            //Horizontal Line
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 116, height: 1) // Adjust height as needed
                .offset(x:6.5,y:0)
            
            
            HStack(alignment: .center ){
                
                
                //Labs Two 1
                TextField("", text: $userData.LabsTwo1)
                         .onChange(of: userData.LabsTwo1) { newValue in
                             if newValue.count > 6 {
                                 LabsError = "Character limit reached. \nAdd more info to notes"
                    isAnimating = true
                             } else {
                                 LabsError = ""
                    isAnimating = false
                             }
                         }
                      .frame(width: 71, height: 36.5)
                      .padding(.leading, 10)
                      .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                      .cornerRadius(16)
                  
                
                
                ZStack(alignment: .bottom) {
                    
                    Group{
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 75)
                            .rotationEffect(.degrees(315), anchor: .bottom)
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 75)
                            .rotationEffect(.degrees(225), anchor: .bottom)
                        
                        
                        
                        
                    }
                    .offset(x:0,y:-28)
                    .padding()
                    .padding(.bottom, 20.0)
                }
                
                
                
                //Labs Two 2 & 3 Text Box
                VStack{
                    
                    TextField("", text: $userData.LabsTwo2)
                             .onChange(of: userData.LabsTwo2) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:-10)
                    
                    
                    TextField("", text: $userData.LabsTwo3)
                             .onChange(of: userData.LabsTwo3) { newValue in
                                 if newValue.count > 6 {
                                     LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                                 } else {
                                     LabsError = ""
                        isAnimating = false
                                 }
                             }
                          .frame(width: 71, height: 36.5)
                          .padding(.leading, 10)
                          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                          .cornerRadius(16)
                          .offset(x:0,y:10)
                    
                }
                .offset(x:-8,y:0)
                
                // Horizontal and Angled Lines
                ZStack(alignment: .bottom) {
                    
                    
                    Group{
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 75)
                            .rotationEffect(.degrees(45), anchor: .bottom)
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 75)
                            .rotationEffect(.degrees(135), anchor: .bottom)
                        
                        
                        
                        
                    }
                    .offset(x:0,y:-37.5)
                    
                }
                
                
                
                //Labs Two 4 Text Box
                TextField("", text: $userData.LabsTwo4)
                         .onChange(of: userData.LabsTwo4) { newValue in
                             if newValue.count > 6 {
                                 LabsError = "Character limit reached. \nAdd more info to notes"
                       isAnimating = true
                             } else {
                                 LabsError = ""
                       isAnimating = false
                             }
                         }
                      .frame(width: 71, height: 36.5)
                      .padding(.leading, 10)
                      .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                      .cornerRadius(16)
                      .offset(x:20,y:0)
                
                
            }
            
        } // End of ZStack
    }
    .padding(.bottom, 20.0)
    
    
    // Labs 3 Graphic
    Group{
        ZStack{
            
    //Horizontal Line
    Rectangle()
        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
        .frame(width: 108, height: 1) // Adjust height as needed
        .offset(x:-50,y:0)
    
    
    HStack(alignment: .center ){
        
        
        //Labs Three 1 & 2 Text Box
        VStack{
            
            TextField("", text: $userData.LabsThree1)
                     .onChange(of: userData.LabsThree1) { newValue in
                         if newValue.count > 6 {
                             LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                         } else {
                             LabsError = ""
                       isAnimating = false
                         }
                     }
                  .frame(width: 71, height: 36.5)
                  .padding(.leading, 10)
                  .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                  .cornerRadius(16)
                  .offset(x:0,y:-10)
            
            
            TextField("", text: $userData.LabsThree2)
                     .onChange(of: userData.LabsThree2) { newValue in
                         if newValue.count > 6 {
                             LabsError = "Character limit reached. \nAdd more info to notes"
                        isAnimating = true
                         } else {
                             LabsError = ""
                       isAnimating = false
                         }
                     }
                  .frame(width: 71, height: 36.5)
                  .padding(.leading, 10)
                  .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                  .cornerRadius(16)
                  .offset(x:0,y:10)
            
            
        }
        .offset(x:-8,y:0)
        
        // Horizontal and Angled Lines
        ZStack(alignment: .bottom) {
            
            
            Group{
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 75)
                    .rotationEffect(.degrees(45), anchor: .bottom)
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 75)
                    .rotationEffect(.degrees(135), anchor: .bottom)
                
                
                
                
            }
            .offset(x:0,y:-37.5)
            
        }
        
        
        
        //Labs Three 3 Text Box
        TextField("", text: $userData.LabsThree3)
                 .onChange(of: userData.LabsThree3) { newValue in
                     if newValue.count > 6 {
                         LabsError = "Character limit reached. \nAdd more info to notes"
                    isAnimating = true
                     } else {
                         LabsError = ""
                   isAnimating = false
                     }
                 }
              .frame(width: 71, height: 36.5)
              .padding(.leading, 10)
              .background(Color(red: 0.96, green: 0.96, blue: 0.96))
              .cornerRadius(16)
              .offset(x:25,y:0)
        
                
                
                
                
                        
                        
                    }
                    
                } // End of ZStack
            }
        }
        
    }
    
/*---------------------------------------------------------------
     
ASA Section 5
*/
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        VStack {
            CircleFive()
                .padding([.bottom], 5) // Adjust padding as needed
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 50) // Adjust height as needed
            
        }
        
        // VStack for the "Procedure Info" and its related fields
        
        VStack(alignment: .leading, spacing: 8) {
            // Procedure Info Text
            Text("ASA Status")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 187, height: 63.12318, alignment: .leading)
            
            
            
            // ASA Status Text
            HStack {
                
                
                Button(action: {
                    userData.ASA1.toggle()
                }) {
                    
                    Image(systemName: userData.ASA1 ? "checkmark.square" : "square")
                        .foregroundColor(userData.ASA1 ? .black : .gray) // Change the color here
                    Text("1")
                        .foregroundColor(userData.ASA1 ? .black : .gray)
                    
                }
                
                
                Button(action: {
                    userData.ASA2.toggle()
                }) {
                    
                    Image(systemName: userData.ASA2 ? "checkmark.square" : "square")
                        .foregroundColor(userData.ASA2 ? .black : .gray) // Change the color here
                    Text("2")
                        .foregroundColor(userData.ASA2 ? .black : .gray)
                    
                }
                .padding(.leading)
                
                Button(action: {
                    userData.ASA3.toggle()
                }) {
                    
                    Image(systemName: userData.ASA3 ? "checkmark.square" : "square")
                        .foregroundColor(userData.ASA3 ? .black : .gray) // Change the color here
                    Text("3")
                        .foregroundColor(userData.ASA3 ? .black : .gray)
                    
                }
                
                
                Button(action: {
                    userData.ASA4.toggle()
                }) {
                    
                    Image(systemName: userData.ASA4 ? "checkmark.square" : "square")
                        .foregroundColor(userData.ASA4 ? .black : .gray) // Change the color here
                    Text("4")
                        .foregroundColor(userData.ASA4 ? .black : .gray)
                    
                }
                
                Button(action: {
                    userData.ASA5.toggle()
                }) {
                    
                    Image(systemName: userData.ASA5 ? "checkmark.square" : "square")
                        .foregroundColor(userData.ASA5 ? .black : .gray) // Change the color here
                    Text("5")
                        .foregroundColor(userData.ASA5 ? .black : .gray)
                    
                }
                
                Button(action: {
                    userData.ASAE.toggle()
                }) {
                    
                    Image(systemName: userData.ASAE ? "checkmark.square" : "square")
                        .foregroundColor(userData.ASAE ? .black : .gray) // Change the color here
                    Text("E")
                        .foregroundColor(userData.ASAE ? .black : .gray)
                    
                }
                
                
                .padding(.leading)
                
                
                
            }
            .padding(.bottom)
            
        }
        
    }
    
                
/*---------------------------------------------------------------
 Continue Section 6
     */
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        
        CircleSix()
            .padding([.bottom], 5) // Adjust padding as needed
        
        // Continue Button
        
  // Data Validation Section
        
        HStack(alignment: .center) {
            Button(action: {
                
                
    if !(userData.RenalWNL || userData.RenalCKD || userData.RenalBPH || userData.RenalESRD) {
        
        ErrorMessage = "Please select at least one renal condition."
        NavigateNextView = false // Prevent navigation
    } else {
        ErrorMessage = ""
        NavigateNextView = true // Trigger navigation
      
    }
        }) {
            Text("Submit Patient History")
                .foregroundColor(.white)
                .frame(width: 283, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
        }
        
        // Notes section display
        if !ErrorMessage.isEmpty {
            Text(ErrorMessage)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.bold))
        }
        
    }
                    
                    
                    
                }
                
//----------------------------------------------------------------
                
        }  // End of main VStack
                
            .sheet(isPresented: $showNotes) {
                        AdditionalNotes(userData: userData, showNotes: $showNotes)
            }

            
        } // End of Scroll View
            
.navigationDestination(isPresented: $NavigateNextView) {
                ConsentView(userData: userData)}
               
        }  //End of Navigation Stack
           
        }  //End of body view
        
        } // End of main struct



struct MedHisB_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to this view
        MedHisB(userData: userData)
    }
}
    
    

        
    


