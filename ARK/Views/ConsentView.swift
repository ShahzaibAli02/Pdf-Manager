//
//  MedHisB.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/5/24.
//


import Foundation

import SwiftUI

struct ConsentView: View {

@ObservedObject var userData: UserEntryData
    
@State private var showNotes = false

// Data validation variables
@State private var isAnimating = false
@State private var ErrorMessage: String = ""
@State private var NavigateNextView: Bool = false

@State private var clearSignature = false
@State private var signatureImage: UIImage?
@State private var clearSignature2 = false
@State private var signatureImage2: UIImage?
@State private var clearSignature3 = false
@State private var signatureImage3: UIImage?
@State private var pdfSignature: Data?

// Max character variables for string fields
@State private var MethodNerveBlockOtherTextError = ""
@State private var AnesthesiaRefusedTextError = ""
@State private var ConsentDateTextError = ""

// Signature UI variables
@State private var isPresentingSignatureView = false
@State private var isPresentingSignatureView2 = false
@State private var isPresentingSignatureView3 = false

let commonText = CommonText()




var body: some View {
NavigationStack{
    
/*-----------------------------------------------------------
Header
*/
        
        Group{
  
            Text("Patient Consent")
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
                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
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
                
                Button(action: {
                                showNotes.toggle()
                }) {
                    
                    
                    AdditionalNotesSymbol(isAnimating: $isAnimating)
                    
                }

            }
            
            
        }
        
        
   

ScrollView{

VStack(alignment: .leading, spacing: 20) {
    

/*
ACKNOWLEDGEMENT SECTION 1
*/
    
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        VStack {
            CircleOne()
                .padding([.bottom], 5) // Adjust padding as needed
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 340) // Adjust height as needed
            
            
        }
        
        
        
        // VStack for the "Cardio Vascular" and its related fields
        
        VStack(alignment: .leading, spacing: 20) {
            // Sub head
            Text("Acknowledgment")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 187, height: 53.12318, alignment: .leading)
            
            
            
            AcknowledgementText()
                .offset(x:0,y:-30)
            
            
            
        }
        
        
    } // End of Section 1
    
    
/*---------------------------------------------------------------
     
     
METHOD SECTION 2
*/
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        VStack {
            CircleTwo()
                .padding([.bottom], 5) // Adjust padding as needed
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 200)
             
            
        }
        
        
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Method")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 187, height: 63.12318, alignment: .leading)
            
            
//Method General Anesthesia
VStack(alignment:.leading) {
HStack {
    Button(action: {
        withAnimation {
            userData.MethodGenA.toggle()
        }
    }) {
        HStack {
            Image(systemName: userData.MethodGenA ? "checkmark.square" : "square")
                .foregroundColor(userData.MethodGenA ? .black : .gray) // Change the color here
            Text("General Anesthesia")
                .foregroundColor(userData.MethodGenA ? .black : .gray)
        }
    }
}
.padding(.bottom)

// If Yes, Enter Frequency
if userData.MethodGenA {
    
    Image("MethodGenA")
        .resizable()
        .frame(width: 600, height: 90)
        .transition(.scale) // Add a transition
}
}
.animation(.easeInOut(duration: 0.3), value: userData.MethodGenA)
   
            
// Methods Spinal
VStack(alignment:.leading) {
HStack {
    Button(action: {
        withAnimation {
            userData.MethodSpinal.toggle()
        }
    }) {
        HStack {
            Image(systemName: userData.MethodSpinal ? "checkmark.square" : "square")
                .foregroundColor(userData.MethodSpinal ? .black : .gray) // Change the color here
            Text("Spinal or Epidural Anesthesia or Analgesia with IV sedation")
                .foregroundColor(userData.MethodSpinal ? .black : .gray)
        }
    }
}
.padding(.bottom)

// If Yes, Enter Frequency
if userData.MethodSpinal {
    
    Image("MethodSpinal")
        .resizable()
        .frame(width: 600, height: 130)
        .transition(.scale) // Add a transition
        .padding(.bottom)
}
}
.animation(.easeInOut(duration: 0.3), value: userData.MethodSpinal)
    
//Method Nerve Block
VStack(alignment:.leading) {
HStack {
    Button(action: {
        withAnimation {
            userData.MethodNerveBlock.toggle()
            
// Reset other states if MethodNeveBlock is false
  if !userData.MethodNerveBlock {
      userData.MethodNerveBlockAxillary = false
      userData.MethodNerveBlockInterscalene = false
      userData.MethodNerveBlockFemoral = false
      userData.MethodNerveBlockIVRegional = false
  }
            
        }
    }) {
HStack {
    Image(systemName: userData.MethodNerveBlock ? "checkmark.square" : "square")
        .foregroundColor(userData.MethodNerveBlock ? .black : .gray) // Change the color here
    Text("Nerve Block Anesthesia or Analgesia with IV Sedation")
        .foregroundColor(userData.MethodNerveBlock ? .black : .gray)
}
    }
}
.padding(.bottom)

// If Yes, Enter Frequency
if userData.MethodNerveBlock {
    
    Button(action: {
        withAnimation {
            userData.MethodNerveBlockAxillary.toggle()
        }
    }) {
        HStack {
            Image(systemName: userData.MethodNerveBlockAxillary ? "checkmark.square" : "square")
                .foregroundColor(userData.MethodNerveBlockAxillary ? .black : .gray)
                .padding(.bottom)
                .padding(.leading,35)
            
            Text("Axillary block")
                .foregroundColor(userData.MethodNerveBlockAxillary ? .black : .gray)
                .padding(.bottom)
            
        }
        
        Button(action: {
            withAnimation {
                userData.MethodNerveBlockInterscalene.toggle()
            }
        }) {
            
            Image(systemName: userData.MethodNerveBlockInterscalene ? "checkmark.square" : "square")
                .foregroundColor(userData.MethodNerveBlockInterscalene ? .black : .gray)
                .padding(.bottom)
                .padding(.leading)
            
            Text("Interscalene block")
                .foregroundColor(userData.MethodNerveBlockInterscalene ? .black : .gray)
                .padding(.bottom)
            
        }
    }
    
  
    
    HStack {
        
        Button(action: {
            withAnimation {
                userData.MethodNerveBlockFemoral.toggle()
            }
        }) {
            
            Image(systemName: userData.MethodNerveBlockFemoral ? "checkmark.square" : "square")
                .foregroundColor(userData.MethodNerveBlockFemoral ? .black : .gray)
                .padding(.bottom)
                .padding(.leading,35)
            
            Text("Femoral nerve block")
                .foregroundColor(userData.MethodNerveBlockFemoral ? .black : .gray)
                .padding(.bottom)
            
        }
        
        Button(action: {
            withAnimation {
                userData.MethodNerveBlockIVRegional.toggle()
            }
        }) {
            
            Image(systemName: userData.MethodNerveBlockIVRegional ? "checkmark.square" : "square")
                .foregroundColor(userData.MethodNerveBlockIVRegional ? .black : .gray)
                .padding(.bottom)
                .padding(.leading)
            
            Text("IV regional (Bier block)")
                .foregroundColor(userData.MethodNerveBlockIVRegional ? .black : .gray)
                .padding(.bottom)
        }
            
    }
                    
    HStack(alignment:.center){

        TextField("Other", text: $userData.MethodNerveBlockOtherText)
               .onChange(of: userData.MethodNerveBlockOtherText) { newValue in
                   if newValue.count > 20 {
                       MethodNerveBlockOtherTextError = "Character limit reached. \nAdd more info to notes"
                       isAnimating = true
                   } else {
                       MethodNerveBlockOtherTextError = ""
                       isAnimating = false
                   }
               }
            .multilineTextAlignment(.leading)
            .frame(width: 230, height: 42.65168)
            .padding(.leading, 10)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .padding(.bottom)
            .padding(.leading, 35)
        
        Text(MethodNerveBlockOtherTextError)
            .foregroundColor(.red)
            .font(
                Font.custom("Inter", size: 15)
                    .weight(.bold)
            )
            .frame(maxWidth: 400, alignment: .leading)
            .frame(maxHeight: 100)
            .lineLimit(nil)
        
    }

            
            
            Image("MethodNerveBlock")
                .resizable()
               // .aspectRatio(contentMode: .fit)
                .frame(width: 600, height: 130)
                .transition(.scale)
                .padding(.bottom)
                .padding(.leading)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: userData.MethodNerveBlock)
            
            
//Monitored Anesthesia Care
VStack(alignment:.leading) {
            HStack {
                Button(action: {
                    withAnimation {
                        userData.MethodMonitoredA.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: userData.MethodMonitoredA ? "checkmark.square" : "square")
                            .foregroundColor(userData.MethodMonitoredA ? .black : .gray) // Change the color here
                        Text("Monitored Anesthesia Care (local anesthesia with IV sedation)")
                            .foregroundColor(userData.MethodMonitoredA ? .black : .gray)
                    }
                }
            }
            .padding(.bottom)

            // If Yes, Enter Frequency
            if userData.MethodMonitoredA {
                
                Image("MethodMoniteredA")
                    .resizable()
                    .frame(width: 600, height: 80)
                    .transition(.scale) // Add a transition
            }
        }
        .animation(.easeInOut(duration: 0.3), value: userData.MethodMonitoredA)
    
    
                }
                
            } // End of Section 2
/*---------------------------------------------------------------
             
             
EXCEPTIONS Section 3
*/


HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
    
    // VStack for the circle and vertical line
    VStack {
        CircleThree()
            .padding([.bottom], 5) // Adjust padding as needed
        
        Rectangle()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .frame(width: 1, height: 450) // Adjust height as needed
        
    }
    
    
    
    VStack(alignment: .leading, spacing: 8) {
        // Procedure Info Text
        Text("Exceptions")
            .font(
                Font.custom("Inter", size: 24)
                    .weight(.semibold)
            )
            .kerning(0.24)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 187, height: 63.12318, alignment: .leading)
        
        
        
        // Exceptions Text
        ExceptionsText()
            .offset(x:0,y:-30)
        
        
        
        VStack(alignment:.leading){
            
            HStack{
                
Button(action: {
    userData.isException.toggle()       
}) {
                 
                       Image(systemName: userData.isException ? "checkmark.square" : "square")
                           .foregroundColor(userData.isException ? .black : .gray) // Change the color here
                       Text("No exception to anesthetic recomendations")
                           .font(Font.custom("Inter", size: 14))
                           .foregroundColor(userData.isPatientASmoker ? .black : .gray)
                   
               }
                
                
                
                
                
            }
            .padding(.bottom,5)
            
            HStack {
                
    Button(action: {
        userData.isRefused.toggle()
    }) {
                     
       Image(systemName: userData.isRefused ? "checkmark.square" : "square")
           .foregroundColor(userData.isRefused ? .black : .gray) // Change the color here
       Text("Anesthesia Refused")
           .font(Font.custom("Inter", size: 14))
           .foregroundColor(userData.isRefused ? .black : .gray)
                       
                   }
                    
                
            }
            
            .padding(.bottom,5)
            
            HStack(alignment:.center){

                TextField("Enter Type of Anesthesia Refused, If Any", text: $userData.AnesthesiaRefusedText)
                       .onChange(of: userData.AnesthesiaRefusedText) { newValue in
                           if newValue.count > 20 {
                               AnesthesiaRefusedTextError = "Character limit reached. \nAdd more info to notes"
                               isAnimating = true
                           } else {
                               AnesthesiaRefusedTextError = ""
                               isAnimating = false
                           }
                       }
                    .font(Font.system(size: 14))
                    .padding(.leading, 10)
                    .frame(width: 290, height: 42.65168)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                Text(AnesthesiaRefusedTextError)
                    .foregroundColor(.red)
                    .font(
                        Font.custom("Inter", size: 15)
                            .weight(.bold)
                    )
                    .frame(maxWidth: 400, alignment: .leading)
                    .lineLimit(nil)
                
            }

                        
                        
                    }
                    
                    
                }
                
            } // End of Section 3
            
/*---------------------------------------------------------------
             
PATIENT CONSENT Section 4
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
                
                // VStack for the "Procedure Info" and its related fields
                
    VStack(alignment: .leading, spacing: 8) {
    // Procedure Info Text
    Text("Patient's Consent")
    .font(
    Font.custom("Inter", size: 24)
    .weight(.semibold)
                        )
    .kerning(0.24)
    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
    .frame(width: 200, height: 63.12318, alignment: .leading)
                    
                    
                    
                    
VStack (alignment:.leading) {
// Text Block
Text("By signing this consent form, I certify and acknowledge that I have read this form or had it read to me, that I understand the risks, alternatives, and expected results of the chosen anesthetic(s), and that I have had ample opportunity to ask questions and consider my decision. I agree to the above provisions, and hereby consent to the administration of the above checked anesthesia services for my operation, treatment, or procedure. I also consent to an alternative type of anesthesia, if necessary, as deemed appropriate by the Anesthesiologist/CRNA.")
.font(Font.custom("Inter", size: 14).weight(.bold))
.foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
.frame(width: 630, height: 89, alignment: .topLeading)
.padding(.bottom)

// Signature Checkbox
HStack {
Button(action: {
    userData.isPatientSignature.toggle()
}) {
    Image(systemName: userData.isPatientSignature ? "checkmark.square" : "square")
        .foregroundColor(userData.isPatientSignature ? .black : .gray)
    Text("Patient Signature")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(userData.isPatientSignature ? .black : .gray)
}
.padding(.bottom, 5)
}

// Guardian or POA Signature Checkbox
HStack {
Button(action: {
    userData.isPatientGuardianSignature.toggle()
}) {
    Image(systemName: userData.isPatientGuardianSignature ? "checkmark.square" : "square")
        .foregroundColor(userData.isPatientGuardianSignature ? .black : .gray)
    Text("Patient’s Guardian or POA Signature")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(userData.isPatientGuardianSignature ? .black : .gray)
}
.padding(.bottom, 5)
}

// Tap to Sign Patient

Text("Patient Signature")
    .font(Font.custom("Inter", size: 14))
    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
    .frame(width: 126, height: 32.80899, alignment: .leading)
    .padding(.top)

Button(action: {
    isPresentingSignatureView = true
}) {
    Text("Tap to Sign")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .frame(width: 181, height: 40.79258)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
}
.popover(isPresented: $isPresentingSignatureView) {
    VStack {
        Text("Patient Sign Here")
            .font(Font.custom("Inter", size: 20))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 166, height: 32.80899, alignment: .leading)

        SignatureViewContainer(clearSignature: $clearSignature, signatureImage: $signatureImage, pdfSignature: $pdfSignature)
            .frame(height: 200)
            .border(Color.gray, width: 1)

        HStack {
            Button("Clear Signature") {
                clearSignature = true
            }
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 181, height: 40.79258)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .padding()

            Button("Save Signature") {
                if let signature = signatureImage {
                    userData.signatureImage = signature
                    isPresentingSignatureView = false
                }
            }
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 181, height: 40.79258)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        }
    }
    .frame(width: 500, height: 350)
    .background(Color.white.opacity(1))
}


// Date Picker

    Text("Date")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .padding(.top, 5.0)

    DatePicker("", selection: $userData.ConsentDateText, displayedComponents: .date)
        .frame(width: 120, height: 35)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
        .datePickerStyle(CompactDatePickerStyle())


// Tap to Sign Witness

    Text("Witness Signature")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .frame(width: 126, height: 32.80899, alignment: .leading)

    Button(action: {
        isPresentingSignatureView2 = true
    }) {
        Text("Tap to Sign")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 181, height: 40.79258)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
    }
    .popover(isPresented: $isPresentingSignatureView2) {
        VStack {
            Text("Witness Sign Here")
                .font(Font.custom("Inter", size: 20))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 166, height: 32.80899, alignment: .leading)

            SignatureViewContainer(clearSignature: $clearSignature2, signatureImage: $signatureImage2, pdfSignature: $pdfSignature)
                .frame(height: 200)
                .border(Color.gray, width: 1)

            HStack {
                Button("Clear Signature") {
                    clearSignature2 = true
                }
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 181, height: 40.79258)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                .padding()

                Button("Save Signature") {
                    if let signature = signatureImage2 {
                        userData.signatureImage2 = signature
                        isPresentingSignatureView2 = false
                    }
                }
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 181, height: 40.79258)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            }
        }
        .frame(width: 500, height: 350)
        .background(Color.white.opacity(1))
    }

}
.padding()

                    
                }
                
                
                
            } //End of Section 4

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
                        .frame(width: 1, height: 245) // Adjust height as needed
                    
                }
                
                // VStack for the "Procedure Info" and its related fields
                
                VStack(alignment: .leading, spacing: 8) {
                    // Procedure Info Text
                    Text("Anesthesiologist/CRNA")
                        .font(
                            Font.custom("Inter", size: 24)
                                .weight(.semibold)
                        )
                        .kerning(0.24)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .frame(width: 287, height: 63.12318, alignment: .leading)
                    
                    
                    
                    // Text
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mauris vitae ultricies ")
            .font(
            Font.custom("Inter", size: 14)
            .weight(.bold)
                )
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 609, height: 44, alignment: .topLeading)
                    
                    
                    
    // Tap to Sign CRNA
        Text("CRNA Signature")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .frame(width: 126, height: 32.80899, alignment: .leading)
                    
                    
        Button(action: {
        isPresentingSignatureView3 = true
                    }) {
            Text("Tap to Sign")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 181, height: 40.79258)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                    }
               .popover(isPresented: $isPresentingSignatureView3) {
                Group {
                            
                Text("CRNA Sign Here")
                .font(Font.custom("Inter", size: 20))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 166, height: 32.80899, alignment: .leading)
                                                      
                SignatureViewContainer(clearSignature: $clearSignature3, signatureImage: $signatureImage3, pdfSignature: $pdfSignature)
                .frame(height: 200)
                .border(Color.gray, width: 1)
                            
    HStack{
        // Button to clear the signature
            Button("Clear Signature") {
            clearSignature3 = true
                }
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .frame(width: 181, height: 40.79258)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
        .padding()
                                
        Button("Save Signature") {
        if let signature = signatureImage3 {
        userData.signatureImage3 = signature
        isPresentingSignatureView3 = false
                }
                }
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .frame(width: 181, height: 40.79258)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
                    }
                }
        .frame(width: 500, height: 350)
        .background(Color.white.opacity(1))
            }

                    
                    
      
    
    // Date
        Text("Date")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

        DatePicker("", selection: $userData.CRNAConsentDateText, displayedComponents: .date)
            .frame(width: 120, height: 35)
            .padding(.trailing)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .datePickerStyle(CompactDatePickerStyle()) // You can choose a different style if preferred
                  
                    
                    
                    
                    
                } //End of Sec5 VStack
                
            } //End of Section 5 2
                    
/*---------------------------------------------------------------
                     
                     
Continue Section 6
*/
        HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                        
                        // VStack for the circle and vertical line
                        
            CircleSix()
            .padding([.bottom], 5) // Adjust padding as needed
                        
                        // Continue Button
                        
            // Create New Procedure Button
                
                HStack(alignment: .center) {
                    Button(action: {
                        
                        
    if !(userData.MethodGenA || userData.MethodSpinal || userData.MethodNerveBlock ||
         userData.MethodNerveBlockAxillary || userData.MethodNerveBlockInterscalene ||
         userData.MethodNerveBlockFemoral || userData.MethodNerveBlockIVRegional || userData.MethodMonitoredA) {

         ErrorMessage = "Please select an anesthesia method."
         NavigateNextView = false // Prevent navigation
                
    } else if !(userData.isException || userData.isRefused) {

        ErrorMessage = "Please acknowledge exceptions."
        NavigateNextView = false // Prevent navigation

    } else if !(userData.isPatientSignature || userData.isPatientGuardianSignature) {

        ErrorMessage = "Please select patient signature type."
        NavigateNextView = false // Prevent navigation

                
            } else {
                ErrorMessage = ""
                NavigateNextView = true // Trigger navigation
              
            }
                }) {
                    Text("Submit Patient Consent")
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
                        
                        
                        
                    } // End of Section 6
                    
                    
              

/*---------------------------------------------------------------
*/


            
}  //End of main VStack 2
    
.sheet(isPresented: $showNotes) {
            AdditionalNotes(userData: userData, showNotes: $showNotes)
}

        
        
}  //End of ScrollView 2
    
.navigationDestination(isPresented: $NavigateNextView) {
                ProcedureStart(userData: userData)}
    
    
} // End of NavigationStack 2


} //End of main body 2


} // End of main struct


struct ConsentView_Previews: PreviewProvider {
static var previews: some View {
// Create an instance of UserEntryData for the preview
let userData = UserEntryData()
// Pass the instance to this view
ConsentView(userData: userData)
}
}









