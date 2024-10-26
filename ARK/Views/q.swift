//
//  MedHisB.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/5/24.
//

import Foundation

import SwiftUI


struct MedHisB: View {
    
    //Section 1 Data
    @State private var AirwayText: String = ""
    @State private var isPatientOnBetaBlockers = false
    @State private var isBetaBlockerGivenDayPrior = false
    @State private var isBetaBlockerGivenIntraOP = false
    @State private var isBetaBlockerContraindicated = false
    
    // Section 2 Data
    @State private var isCameraPresented = false
    @State private var selectedImage: UIImage?
    
    @State private var PulminaryText: String = ""
    @State private var isPatientASmoker = false
    @State private var FacilityText: String = ""
    @State private var PhysicianText: String = ""
    @State private var CRNAText: String = ""

    // Section 3 Data
    @State private var LabsOne1: String = ""
    @State private var LabsOne2: String = ""
    @State private var LabsOne3: String = ""
    @State private var LabsOne4: String = ""
    @State private var LabsOne5: String = ""
    @State private var LabsOne6: String = ""
    @State private var LabsOne7: String = ""
    
    @State private var LabsTwo1: String = ""
    @State private var LabsTwo2: String = ""
    @State private var LabsTwo3: String = ""
    @State private var LabsTwo4: String = ""
    
    @State private var LabsThree1: String = ""
    @State private var LabsThree2: String = ""
    @State private var LabsThree3: String = ""


    let commonText = CommonText()
    

    
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 20) {
                
           
                    
                    Group{
                    // Title
                    Text("New Procedure - \(commonText.FormattedDate)")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .frame(width: 308, height: 28, alignment: .center)
                        .offset(x:250  ,y:0)
                    
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
                                .cornerRadius(10)
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
                            
                        
                    }
                    
                    
                }
                
                
/*---------------------------------------------------------------
                 
                 
Airway SECTION 1
*/
                
                HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                    
                    // VStack for the circle and vertical line
                    VStack {
                        CircleOne()
                            .padding([.bottom], 5) // Adjust padding as needed
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 50) // Adjust height as needed
                        
                        
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
                        
                        
                        
                        // Dropdown Menu
                        /* Text("Text")
                         .font(Font.custom("Inter", size: 14))
                         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                         */
                        
                        TextField("   Enter Conditions That Apply", text: $AirwayText)
                            .frame(width: 250, height: 42.65168)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(16)
                        
                        
                        
                        
                    }
                    
                    
                }
                        
                        
                        
                        
                    
                
                    
/*---------------------------------------------------------------
                     
                     
Dentition SECTION 2
 */
                HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                    
                    // VStack for the circle and vertical line
                    VStack {
                        CircleTwo()
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
                        
                        
       //Dentition Camera Button
                        
                        Button(action: {
                            isCameraPresented = true
                        }) {
                            Image(systemName: "camera")
                                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                                .foregroundColor(.white) // Set the color of the icon
                                .cornerRadius(30)
                        }
                        .sheet(isPresented: $isCameraPresented) {
                            ImagePicker(isPresented: $isCameraPresented, selectedImage: $selectedImage)
                        }


                        
                        
                    }
                    
                }
                    
/*---------------------------------------------------------------
                     
                     
Labs Section 3
*/
                
                
                HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                    
                    // VStack for the circle and vertical line
                    VStack {
                        CircleThree()
                            .padding([.bottom], 5) // Adjust padding as needed
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 275) // Adjust height as needed
                        
                    }
                    

                    
                    VStack(alignment: .leading, spacing: 8) {
                        // Procedure Info Text
                        Text("Neurological")
                            .font(
                                Font.custom("Inter", size: 24)
                                    .weight(.semibold)
                            )
                            .kerning(0.24)
                            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                            .frame(width: 187, height: 63.12318, alignment: .leading)
                        
                        
                        
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
                                        
                                        TextField("", text: $LabsOne1)
                                            .frame(width: 71, height: 36.5)
                                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                            .cornerRadius(16)
                                        
                                        
                                        TextField("", text: $LabsOne2)
                                            .frame(width: 71, height: 36.5)
                                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                            .cornerRadius(16)
                                        
                                    }
                                    
                                    Rectangle()
                                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .frame(width: 1, height: 75) // Adjust height as needed
                                    
                                    //Labs One 3 & 4 Text Box
                                    VStack{
                                        
                                        TextField("", text: $LabsOne3)
                                            .frame(width: 71, height: 36.5)
                                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                            .cornerRadius(16)
                                        
                                        TextField("", text: $LabsOne4)
                                            .frame(width: 71, height: 36.5)
                                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                            .cornerRadius(16)
                                        
                                    }
                                    
                                    Rectangle()
                                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .frame(width: 1, height: 75) // Adjust height as needed
                                    
                                    //Labs One 5 & 6 Text Box
                                    VStack{
                                        
                                        TextField("", text: $LabsOne5)
                                            .frame(width: 71, height: 36.5)
                                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                            .cornerRadius(16)
                                        
                                        TextField("", text: $LabsOne6)
                                            .frame(width: 71, height: 36.5)
                                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                            .cornerRadius(16)
                                        
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
                                    TextField("", text: $LabsOne7)
                                        .frame(width: 71, height: 36.5)
                                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                        .cornerRadius(16)
                                        .offset(x:25,y:0)
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                
                            } // End of ZStack
                        }
                        .padding(.bottom)
                        
// Labs 2 Graphic
                        Group{
                              ZStack{
                                                        
                                   Rectangle()
                      .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
               .frame(width: 265, height: 1) // Adjust height as needed
                      .offset(x:-45,y:0)
                                                        
                                                        
                         HStack(alignment: .center ){
                                                            
                                                            
                   //Labs One 1 & 2 Text Box
                             
            TextField("", text: $LabsOne5)
            .frame(width: 71, height: 36.5)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .padding()
                             
                             
                             
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
                .offset(x:0,y:-37.5)
                                                                                     
                                                                                 }
                                                                                 
                                                            
                                                           
                                                            
                                                   
                                             
                                                           
                                                            
           //Labs One 5 & 6 Text Box
           VStack{
                                                                
           TextField("", text: $LabsOne5)
          .frame(width: 71, height: 36.5)
          .background(Color(red: 0.96, green: 0.96, blue: 0.96))
          .cornerRadius(16)
                                                                
          TextField("", text: $LabsOne6)
          .frame(width: 71, height: 36.5)
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
                                                                
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
        TextField("", text: $LabsOne7)
        .frame(width: 71, height: 36.5)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .offset(x:25,y:0)
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                        }
                                                        
                        } // End of ZStack
                    }
                        .padding()
                    }
                    
                }
                    
/*---------------------------------------------------------------
                     
                     
Gastrointestinal Section 4
*/
                HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                    
                    // VStack for the circle and vertical line
                    VStack {
                        CircleFour()
                            .padding([.bottom], 5) // Adjust padding as needed
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 50) // Adjust height as needed
                        
                    }
                    
                    // VStack for the "Procedure Info" and its related fields
                    
                    VStack(alignment: .leading, spacing: 8) {
                        // Procedure Info Text
                        Text("Gastrointestinal")
                            .font(
                                Font.custom("Inter", size: 24)
                                    .weight(.semibold)
                            )
                            .kerning(0.24)
                            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                            .frame(width: 187, height: 63.12318, alignment: .leading)
                        
                        
                        
                        // Pulmonary Condition Text
                        Group{
                            TextField("   Enter Conditions That Apply", text: $PulminaryText)
                                .frame(width: 250, height: 42.65168)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(16)
                            
                            
                        }
                        
                    }
                    
                }
                    
                    
                    
                    
/*---------------------------------------------------------------
                     
                     
Pre-Op Signature Section 5
 */
                HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                    
                    // VStack for the circle and vertical line
                    VStack {
                        CircleFive()
                            .padding([.bottom], 0) // Adjust padding as needed
                        
                        Rectangle()
                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 1, height: 45) // Adjust height as needed
                        
                    }
                    
                    // VStack for the "Procedure Info" and its related fields
                    
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
                        
                        
                        
                        // Pulmonary Condition Text
                        Group{
                            TextField("   Enter Conditions That Apply", text: $PulminaryText)
                                .frame(width: 250, height: 42.65168)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(16)
                                .offset(x:0, y:-10)
                            
                        }
                        
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
                    
                    
                    
                    NavigationLink(destination: MedHisB()) {
                        Text("Continue")
                            .foregroundColor(.white)
                        
                            .frame(width: 283, height: 49)
                            .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                        
                            .cornerRadius(30)
                        
                    }
                    
                    
                    
                }
                                                    
                    
                    
            }  // End of main VStack
                
                
                
               
            }  //End of Navigation Stack
           
        
        
            }  //End of body view
        
  
    

} // End of main struct


    
    struct MedHisB_Previews: PreviewProvider {
        static var previews: some View {
            MedHisB()
        }
    }
    
    

        
    


